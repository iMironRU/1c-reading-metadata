#!/usr/bin/env python3
"""Переносит блоки ответов из параграфов в файл ответов в конце части.

Канон (docs/style-guide.md, «Ответы — в конце части, не под вопросом»):
ответ, увиденный сразу после вопроса, отменяет припоминание.

Учитывает, что книги серии устроены по-разному:
  - заголовок блока бывает «Ответы (три уровня)», «Ответы и указания»,
    «Ответы, указания, разборы»; в одном файле блоков может быть два;
  - переход курсивом стоит то перед контрольными вопросами, то в самом
    конце файла. Указатель «Ответы — в конце части» ставится перед ним,
    а не после: последним в параграфе всегда остаётся переход.

Запуск из корня книги:  python3 scripts/migrate_otvety.py [--dry]
"""
import re, sys, glob, os, collections

DRY = "--dry" in sys.argv
HEAD = re.compile(r"^## Ответы[^\n]*$", re.M)
TAIL_TRANSITION = re.compile(r"\n+---\n+\*.*?\*\s*$", re.S)
POINTER = "Ответы — в конце части."

def cut_answers(text):
    """Вырезает все блоки ответов. Возвращает (остаток, объединённое тело)."""
    bodies, rest = [], text
    while True:
        m = HEAD.search(rest)
        if not m:
            break
        tail = rest[m.end():]
        nxt = re.search(r"^## |^---\s*$", tail, re.M)
        end = m.end() + (nxt.start() if nxt else len(tail))
        bodies.append(rest[m.end():end].strip("\n"))
        rest = rest[:m.start()].rstrip("\n") + "\n\n" + rest[end:].lstrip("\n")
    return (rest, "\n\n".join(bodies)) if bodies else (text, None)

def put_pointer(text):
    text = re.sub(r"\n*^" + re.escape(POINTER) + r"\n+", "\n\n", text, flags=re.M)
    m = TAIL_TRANSITION.search(text)
    if m:
        return text[:m.start()].rstrip("\n") + f"\n\n{POINTER}\n\n" + text[m.start():].lstrip("\n") + "\n"
    return text.rstrip("\n") + f"\n\n{POINTER}\n"

parts = collections.defaultdict(list)
for f in sorted(glob.glob("chapters/*/*.md")):
    if f.endswith("-99_otvety.md"):
        continue
    src = open(f, encoding="utf-8").read()
    rest, answers = cut_answers(src)
    if answers is None:
        continue
    title = re.search(r"^# (.+)$", src, re.M).group(1).strip()
    parts[os.path.dirname(f)].append((f, title, answers))
    if not DRY:
        open(f, "w", encoding="utf-8").write(put_pointer(rest))

for d, items in sorted(parts.items()):
    num = os.path.basename(d).split("_")[0]
    out = os.path.join(d, f"{num}-99_otvety.md")
    part = re.sub(r"^§\s*(\d+)\..*", r"\1", items[0][1])
    lines = ["---", "status: draft", "---", "", f"# Ответы к части {part}", "",
             "Ответы собраны здесь, а не под вопросами: подсказка, увиденная сразу",
             "после вопроса, отменяет попытку вспомнить.", ""]
    for _, title, body in items:
        lines += [f"## {title}", "", body, ""]
    if not DRY:
        open(out, "w", encoding="utf-8").write("\n".join(lines).rstrip("\n") + "\n")
    print(f"{'[dry] ' if DRY else ''}{out}: {len(items)} параграфов, {sum(len(b.split()) for _,_,b in items)} слов")
