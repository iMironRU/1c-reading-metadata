#!/usr/bin/env bash
# review.sh — отправить параграф на рецензию (DeepSeek или OpenAI)
#
# Использование:
#   ./scripts/review.sh <файл>               — DeepSeek v4-pro (по умолчанию)
#   ./scripts/review.sh <файл> gpt-4.1       — OpenAI GPT-4.1
#   ./scripts/review.sh <файл> deepseek-v4-pro
#
# Требования:
#   - Python 3 в PATH
#   - .env с DEEPSEEK_API_KEY и/или OPENAI_API_KEY

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

CHAPTER_FILE="${1:-}"
MODEL="${2:-deepseek-v4-pro}"

if [[ -z "$CHAPTER_FILE" ]]; then
    echo "Использование: $0 <путь к файлу параграфа> [модель]" >&2
    exit 1
fi

if [[ ! -f "$CHAPTER_FILE" ]]; then
    echo "Файл не найден: $CHAPTER_FILE" >&2
    exit 1
fi

CHAPTER_FILE="$CHAPTER_FILE" SCRIPT_DIR="$SCRIPT_DIR" ROOT_DIR="$ROOT_DIR" MODEL="$MODEL" \
python3 - << 'PYTHON_EOF'
import sys, os, json, re, urllib.request, urllib.error
from datetime import date
from pathlib import Path

script_dir   = Path(os.environ["SCRIPT_DIR"])
root_dir     = Path(os.environ["ROOT_DIR"])
chapter_file = Path(os.environ["CHAPTER_FILE"])
model        = os.environ["MODEL"]

if not chapter_file.is_absolute():
    chapter_file = Path.cwd() / chapter_file

# --- Определить провайдера по имени модели ---
is_openai = model.startswith(("gpt-", "o1", "o3", "o4", "chatgpt"))

# --- Загрузить ключи из .env ---
env_path = root_dir / ".env"
keys = {}
if env_path.exists():
    for line in env_path.read_text().splitlines():
        line = line.strip()
        if line.startswith("#") or "=" not in line:
            continue
        k, v = line.split("=", 1)
        keys[k.strip()] = v.strip()

if is_openai:
    api_key = keys.get("OPENAI_API_KEY")
    if not api_key:
        print("Ошибка: OPENAI_API_KEY не найден в .env", file=sys.stderr)
        sys.exit(1)
    api_url = "https://api.openai.com/v1/chat/completions"
    provider_label = "OpenAI"
else:
    api_key = keys.get("DEEPSEEK_API_KEY")
    if not api_key:
        print("Ошибка: DEEPSEEK_API_KEY не найден в .env", file=sys.stderr)
        sys.exit(1)
    api_url = "https://api.deepseek.com/chat/completions"
    provider_label = "DeepSeek"

# --- Промпт и текст параграфа ---
prompt_path   = root_dir / "scripts" / "prompts" / "reviewer.md"
system_prompt = prompt_path.read_text(encoding="utf-8")
chapter_text  = chapter_file.read_text(encoding="utf-8")

# --- Запрос к API ---
payload = {
    "model": model,
    "messages": [
        {"role": "system", "content": system_prompt},
        {"role": "user",   "content": f"Вот параграф для рецензии:\n\n{chapter_text}"}
    ],
    "temperature": 0.3,
    "max_tokens": 4096
}

req = urllib.request.Request(
    api_url,
    data=json.dumps(payload).encode("utf-8"),
    headers={"Content-Type": "application/json",
             "Authorization": f"Bearer {api_key}"},
    method="POST"
)

print(f"Отправляю запрос в {provider_label} ({model})...", flush=True)
try:
    with urllib.request.urlopen(req, timeout=120) as resp:
        result = json.loads(resp.read().decode("utf-8"))
except urllib.error.HTTPError as e:
    print(f"Ошибка HTTP {e.code}: {e.read().decode('utf-8', 'replace')}", file=sys.stderr)
    sys.exit(1)
except urllib.error.URLError as e:
    print(f"Ошибка сети: {e.reason}", file=sys.stderr)
    sys.exit(1)

review_text = result["choices"][0]["message"]["content"]
model_used  = result.get("model", model)
tokens      = result.get("usage", {})

# --- Путь для сохранения рецензии ---
rel         = chapter_file.relative_to(root_dir / "chapters")
module_dir  = rel.parts[0]
stem        = rel.stem
today       = date.today().isoformat()
model_short = re.sub(r"[^a-z0-9\-]", "", model_used.lower())[:20]

out_dir = root_dir / "reviews" / module_dir
out_dir.mkdir(parents=True, exist_ok=True)
out_file = out_dir / f"{stem}.{model_short}.{today}.md"

# --- Сохранить с YAML-фронтматтером ---
frontmatter = (
    f"---\n"
    f"file: chapters/{rel}\n"
    f"model: {model_used}\n"
    f"date: {today}\n"
    f"tokens_prompt: {tokens.get('prompt_tokens', '?')}\n"
    f"tokens_completion: {tokens.get('completion_tokens', '?')}\n"
    f"---\n\n"
)
out_file.write_text(frontmatter + review_text, encoding="utf-8")
print(f"Рецензия сохранена: {out_file.relative_to(root_dir)}")

# --- Обновить docs/review-status.json ---
status_path = root_dir / "docs" / "review-status.json"
status = json.loads(status_path.read_text()) if status_path.exists() else {}

chapter_key = f"chapters/{rel}"
entry       = status.get(chapter_key, {})
history     = entry.get("history", [])
history.append({
    "date":  today,
    "model": model_used,
    "file":  str(out_file.relative_to(root_dir))
})
entry.update({
    "history":       history,
    "last_reviewed": today,
    "last_model":    model_used
})
status[chapter_key] = entry

status_path.write_text(json.dumps(status, ensure_ascii=False, indent=2))
print(f"Статус обновлён: {chapter_key}")
PYTHON_EOF
