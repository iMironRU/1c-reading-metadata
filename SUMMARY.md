# Содержание

- [О книге](README.md)

## Модуль 0. Что такое дерево метаданных и как открыть Конфигуратор

- [§ 0.1. Метаданные — это не программа, а описание устройства](chapters/00_vvedenie/00-01_metadannye-eto-ne-programma.md)
- [§ 0.2. Дерево как форма организации](chapters/00_vvedenie/00-02_derevo-kak-forma.md)
- [§ 0.3. Первый запуск Конфигуратора](chapters/00_vvedenie/00-03_pervyy-zapusk.md)
- [§ 0.4. Что хранится и что делает: два разных слоя](chapters/00_vvedenie/00-04_chto-hranitsya-i-chto-delaet.md)
- [§ 0.5. Фирма «Канцтовары»: что мы хотим автоматизировать](chapters/00_vvedenie/00-05_firma-kantctovary.md)
- [§ 0.6. Итог модуля 0](chapters/00_vvedenie/00-06_itog.md)

## Модуль 1. Существительные — справочники

- [§ 1.1. Справочник как список чего-либо](chapters/01_spravochniki/01-01_spravochnik-kak-spisok.md)
- [§ 1.2. Реквизиты — свойства элемента](chapters/01_spravochniki/01-02_rekvizity.md)
- [§ 1.3. Иерархия в справочнике: группы и элементы](chapters/01_spravochniki/01-03_ierarhiya.md)
- [§ 1.4. Табличные части — список строк внутри элемента](chapters/01_spravochniki/01-04_tablichnye-chasti.md)
- [§ 1.5. Зачем нужна структура: каждая сущность живёт ровно в одном месте](chapters/01_spravochniki/01-05_zachem-nuzhna-struktura.md)
- [§ 1.6. Чтение справочника: перевести на бизнес-язык](chapters/01_spravochniki/01-06_chtenie-spravochnika.md)
- [§ 1.7. Создаём справочник «Товары»: объект и тип одновременно](chapters/01_spravochniki/01-07_sozdayom-spravochnik.md)
- [§ 1.8. Итог модуля 1](chapters/01_spravochniki/01-08_itog.md)

## Модуль 2. Глаголы — документы

- [§ 2.1. Документ как запись факта](chapters/02_dokumenty/02-01_dokument-kak-zapis-fakta.md)
- [§ 2.2. Реквизиты документа: номер, дата, контрагент](chapters/02_dokumenty/02-02_rekvizity-dokumenta.md)
- [§ 2.3. Табличная часть документа — список позиций](chapters/02_dokumenty/02-03_tablichnaya-chast.md)
- [§ 2.4. Проведение документа](chapters/02_dokumenty/02-04_provedenie.md)
- [§ 2.5. Зачем ссылка: проблема хранения строки](chapters/02_dokumenty/02-05_zachem-ssylka.md)
- [§ 2.6. Как работает ссылка: имя собственное](chapters/02_dokumenty/02-06_kak-rabotaet-ssylka.md)
- [§ 2.7. Объект = тип: создав справочник, мы создали не только список](chapters/02_dokumenty/02-07_obekt-eto-tip.md)
- [§ 2.8. Создаём документ «ПоступлениеТоваров» для «Канцтоваров»](chapters/02_dokumenty/02-08_sozdayom-dokument.md)
- [§ 2.9. Итог модуля 2](chapters/02_dokumenty/02-09_itog.md)

## Модуль 3. Таблицы фактов — регистры сведений

- [§ 3.1. Зачем нужны регистры: документы плохо отвечают на вопросы о состоянии](chapters/03_registry-svedeniy/03-01_zachem-nuzhny-registry.md)
- [§ 3.2. Регистр сведений независимый: когда документ не нужен](chapters/03_registry-svedeniy/03-02_nezavisimyy-registr.md)
- [§ 3.3. Измерения и ресурсы: таблица как «ключ → значение»](chapters/03_registry-svedeniy/03-03_izmerenya-i-resursy.md)
- [§ 3.4. Периодичность: как часто меняется значение](chapters/03_registry-svedeniy/03-04_periodichnost.md)
- [§ 3.5. Регистр сведений подчинённый регистратору](chapters/03_registry-svedeniy/03-05_podchinennyy-registr.md)
- [§ 3.6. Понятие регистратора: документ берёт ответственность](chapters/03_registry-svedeniy/03-06_ponyatie-registratora.md)
- [§ 3.7. Создаём регистр «ЦеныТоваров» и документ «ПриказОбИзмененииЦен»](chapters/03_registry-svedeniy/03-07_sozdayom-registr.md)
- [§ 3.8. Итог модуля 3](chapters/03_registry-svedeniy/03-08_itog.md)

## Модуль 4. Движения и итоги — регистры накопления

- [§ 4.1. От сведений к накоплению: что меняется](chapters/04_registry-nakopleniya/04-01_ot-svedeniy-k-nakopleniyu.md)
- [§ 4.2. Движение: приход и расход](chapters/04_registry-nakopleniya/04-02_dvizhenie-prihod-i-rashod.md)
- [§ 4.3. Измерения и ресурсы в регистре накопления](chapters/04_registry-nakopleniya/04-03_izmerenya-i-resursy.md)
- [§ 4.4. Остатки и обороты: два вида итогов](chapters/04_registry-nakopleniya/04-04_ostatki-i-oboroty.md)
- [§ 4.5. Документ-регистратор: кто пишет движения](chapters/04_registry-nakopleniya/04-05_registrator-nakopleniya.md)
- [§ 4.6. Чтение регистра накопления](chapters/04_registry-nakopleniya/04-06_chtenie-registra.md)
- [§ 4.7. Создаём регистр «ТоварыНаСкладах» и справочник «Склады»](chapters/04_registry-nakopleniya/04-07_sozdayom-registr.md)
- [§ 4.8. Итог модуля 4](chapters/04_registry-nakopleniya/04-08_itog.md)

## Модуль 5. Вопросы и ответы — отчёты

- [§ 5.1. Отчёт как ответ на бизнес-вопрос](chapters/05_otchety/05-01_otchet-kak-otvet.md)
- [§ 5.2. Схема компоновки данных: как устроен отчёт внутри](chapters/05_otchety/05-02_skd-kak-ustroyen-otchet.md)
- [§ 5.3. Отчёт на основе регистра: как данные становятся строками и колонками](chapters/05_otchety/05-03_otchet-na-osnove-registra.md)
- [§ 5.4. Создаём отчёт «ОстаткиТоваровНаСкладе»](chapters/05_otchety/05-04_sozdayom-otchet.md)
- [§ 5.5. Итог модуля 5](chapters/05_otchety/05-05_itog.md)

## Модуль 6. Связи между объектами: читаем дерево целиком

- [§ 6.1. Подчинение справочника: как одни объекты принадлежат другим](chapters/06_svyazi/06-01_vladeletc-i-podchinenie.md)
- [§ 6.2. Движения и регистраторы: смотрим с другой стороны](chapters/06_svyazi/06-02_dvizhenia-so-storony-registra.md)
- [§ 6.3. Общие реквизиты: атрибуты, которые принадлежат всей конфигурации](chapters/06_svyazi/06-03_obshchie-rekvizity.md)
- [§ 6.4. Как читать чужое дерево: три стратегии навигации](chapters/06_svyazi/06-04_kak-chitat-chuzhoe-derevo.md)
- [§ 6.5. Итоговое упражнение: читаем «Канцтовары» вслух](chapters/06_svyazi/06-05_itogovoe-uprazhnenie.md)
- [§ 6.6. Итог модуля 6](chapters/06_svyazi/06-06_itog.md)

## Модуль 7. Другие объекты дерева

- [§ 7.1. Перечисления: список, закрытый навсегда](chapters/07_drugie-obekty/07-01_perechisleniya.md)
- [§ 7.2. Планы счетов и регистры бухгалтерии](chapters/07_drugie-obekty/07-02_plan-schetov-i-registr-buhgalterii.md)
- [§ 7.3. Регистры расчёта и планы видов расчёта](chapters/07_drugie-obekty/07-03_registry-rascheta.md)
- [§ 7.4. Планы видов характеристик: прилагательные пользователя](chapters/07_drugie-obekty/07-04_pvh.md)
- [§ 7.5. Бизнес-процессы и задачи](chapters/07_drugie-obekty/07-05_biznes-processy.md)
- [§ 7.6. Роли и безопасность](chapters/07_drugie-obekty/07-06_roli-i-bezopasnost.md)
- [§ 7.7. Другие объекты дерева: константы, планы обмена, журналы документов, функциональные опции](chapters/07_drugie-obekty/07-07_drugie-obekty.md)
- [§ 7.8. Итог модуля 7](chapters/07_drugie-obekty/07-08_itog.md)

## Модуль 8. Как читать большое незнакомое дерево

- [§ 8.1. Подсистемы: первый шаг перед любой навигацией](chapters/08_kak-chitat-bolshoe-derevo/08-01_podsistemy.md)
- [§ 8.2. Приём «от отчёта»: читаем цепочку в обратном направлении](chapters/08_kak-chitat-bolshoe-derevo/08-02_ot-otcheta.md)
- [§ 8.3. Приём «от документа»: читаем цепочку в прямом направлении](chapters/08_kak-chitat-bolshoe-derevo/08-03_ot-dokumenta.md)
- [§ 8.4. Как читать имена объектов](chapters/08_kak-chitat-bolshoe-derevo/08-04_imena-obektov.md)
- [§ 8.5. Карта конфигурации: фиксируем то, что читаем](chapters/08_kak-chitat-bolshoe-derevo/08-05_karta.md)
- [§ 8.6. «Шум» в реальных конфигурациях: как не принять мусор за архитектуру](chapters/08_kak-chitat-bolshoe-derevo/08-06_shum.md)
- [§ 8.7. Что делать, если объект непонятен: алгоритм самодиагностики](chapters/08_kak-chitat-bolshoe-derevo/08-07_samodiagnostika.md)
- [§ 8.8. Итог модуля 8](chapters/08_kak-chitat-bolshoe-derevo/08-08_itog.md)

## Модуль 9. Завершение: от чтения к созданию

- [§ 9.1. Контрольное чтение: незнакомое дерево вслух](chapters/09_zavershenie/09-01_kontrolnoe-chtenie.md)
- [§ 9.2. Контрольное проектирование: «ВелоПрокат»](chapters/09_zavershenie/09-02_kontrolnoe-proektirovanie.md)
- [§ 9.3. Куда идти дальше](chapters/09_zavershenie/09-03_kuda-idti-dalshe.md)
- [§ 9.4. Итог: конец курса](chapters/09_zavershenie/09-04_itog.md)
