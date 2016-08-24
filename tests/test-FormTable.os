#Использовать asserts

Перем юТест;
Перем ВидыПоляФормы;
Перем Форма;
Перем ТекстПроверки;
Перем УправляемыйИнтерфейс;
Перем Поле1;
Перем ПровайдерТЗ;

Процедура Инициализация()
	ПодключитьВнешнююКомпоненту("oscript-component/bin/Release/oscript-simple-gui.dll");
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт
	
	юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	// СписокТестов.Добавить("Тест_Должен_СоздатьПоле");
	// СписокТестов.Добавить("Тест_Должен_ОбработатьВыделенныеСтроки");
	// СписокТестов.Добавить("Тест_Должен_ОбработатьТекущаяСтрока");
	// СписокТестов.Добавить("Тест_Должен_ОбработатьТекущиеДанные");
	СписокТестов.Добавить("Тест_Должен_УправлятьКолонками");
	// СписокТестов.Добавить("Тест_Должен_УправлятьСобытиями");
	
	Возврат СписокТестов;
	
КонецФункции

//# Работа с событиями
Процедура ПриОткрытииФормы() Экспорт
	// Форма.Закрыть();
КонецПроцедуры

Процедура ПриПотереФокусаЯчейки() Экспорт
	Сообщить("Смена ячейки: " + Поле1.ТекущиеДанные[0]);
КонецПроцедуры

Процедура ПриДвойномКлике() Экспорт
	Сообщить("Дабл клик: " + Поле1.ТекущиеДанные[0]);
КонецПроцедуры

Процедура ПриВыборе() Экспорт
	Сообщить("ПриВыборе: " + Поле1.ТекущиеДанные[0]);
КонецПроцедуры

Процедура ПолучитьФорму()
	
	УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
	Форма = УправляемыйИнтерфейс.СоздатьФорму();
	Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
	ВидыПоляФормы = Форма.ВидГруппыФормы;
	
КонецПроцедуры

Функция ПолучитьТЗ()
	
	ТЗ = Новый ТаблицаЗначений;
	ТЗ.Колонки.Добавить("Код");
	ТЗ.Колонки.Добавить("Наименование");
	ТЗ.Колонки.Добавить("ДатаРождения");
	
	СтрокаТЗ = ТЗ.Добавить();
	СтрокаТЗ.Код = 1;
	СтрокаТЗ.Наименование = "Вася";
	СтрокаТЗ.ДатаРождения = Дата(2000,2,1);
	
	СтрокаТЗ = ТЗ.Добавить();
	СтрокаТЗ.Код = 2;
	СтрокаТЗ.Наименование = "Коля";
	СтрокаТЗ.ДатаРождения = Дата(2010,5,2);
	
	СтрокаТЗ = ТЗ.Добавить();
	СтрокаТЗ.Код = 3;
	СтрокаТЗ.Наименование = "Саша";
	
	Возврат ТЗ;	
КонецФункции // ПолучитьТЗ()

Процедура Тест_Должен_СоздатьПоле() Экспорт
	
	ПолучитьФорму();
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	
	//
	Строки = Поле1.ВыделенныеСтроки;
	Для каждого Стр Из Строки Цикл
		Сообщить(Стр);
	КонецЦикла;
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();
	
КонецПроцедуры

Процедура ПриНажатииНаКнопкуВыделенныеСтроки() Экспорт
	Сообщить("Нажали");
	Строки = Поле1.ВыделенныеСтроки;
	Для каждого Стр Из Строки Цикл
		Сообщить("Выделено: " + Стр);
	КонецЦикла;
КонецПроцедуры

Процедура Тест_Должен_ОбработатьВыделенныеСтроки() Экспорт
	
	ПолучитьФорму();
	
	КнопкаВыделенныеСтроки = Форма.Элементы.Добавить("КнопкаВыделенныеСтроки", "КнопкаФормы", Неопределено);
	КнопкаВыделенныеСтроки.Заголовок = "Обработать выделенные";
	КнопкаВыделенныеСтроки.УстановитьДействие(ЭтотОбъект, "Нажатие", "ПриНажатииНаКнопкуВыделенныеСтроки");
	
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();
	
КонецПроцедуры

Процедура ПриНажатииНаКнопкуНомерСтроки() Экспорт
	Сообщить("Тек. номер строки: " + Поле1.ТекущаяСтрока);
	Поле1.ТекущаяСтрока = 2;
КонецПроцедуры

Процедура Тест_Должен_ОбработатьТекущаяСтрока() Экспорт
	
	ПолучитьФорму();
	
	КнопкаНомерСтроки = Форма.Элементы.Добавить("КнопкаВыделенныеСтроки", "КнопкаФормы", Неопределено);
	КнопкаНомерСтроки.Заголовок = "ТекущаяСтрока";
	КнопкаНомерСтроки.УстановитьДействие(ЭтотОбъект, "Нажатие", "ПриНажатииНаКнопкуНомерСтроки");
	
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();
	
КонецПроцедуры

Процедура ПриНажатииНаКнопкуТекущиеДанные() Экспорт
	ТекДанные = Поле1.ТекущиеДанные;
	
	ТекДанные.Код = 4;
	
	Поле1.Обновить();
	
КонецПроцедуры

Процедура Тест_Должен_ОбработатьТекущиеДанные() Экспорт
	ПолучитьФорму();
	
	КнопкаНомерСтроки = Форма.Элементы.Добавить("КнопкаВыделенныеСтроки", "КнопкаФормы", Неопределено);
	КнопкаНомерСтроки.Заголовок = "ТекущиеДанные";
	КнопкаНомерСтроки.УстановитьДействие(ЭтотОбъект, "Нажатие", "ПриНажатииНаКнопкуТекущиеДанные");
	
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();	
КонецПроцедуры

Процедура ПриНажатииНаКнопкуУправлятьКолонками() Экспорт
	Колонки = Поле1.Колонки;
	
	Сообщить("Колонка: " + Колонки[0].Заголовок);
	Колонки[0].Заголовок = "Код (Таб.номер)";
	Колонки[1].Заголовок = "Наименование сотрудника";
	Колонки[1].Ширина = 150;
	Колонки[2].Видимость = Ложь;
	
	Для каждого Колонка Из Колонки Цикл
		Сообщить(Колонка.Заголовок);
	КонецЦикла;

Сообщить(поле1.ТекущийЭлемент.Индекс);

КонецПроцедуры

Процедура Тест_Должен_УправлятьКолонками() Экспорт
	ПолучитьФорму();
	
	КнопкаНомерСтроки = Форма.Элементы.Добавить("КнопкаВыделенныеСтроки", "КнопкаФормы", Неопределено);
	КнопкаНомерСтроки.Заголовок = "Управлять колонками";
	КнопкаНомерСтроки.УстановитьДействие(ЭтотОбъект, "Нажатие", "ПриНажатииНаКнопкуУправлятьКолонками");
	
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();	
КонецПроцедуры

Процедура Тест_Должен_УправлятьСобытиями() Экспорт
	ПолучитьФорму();
	
	ПровайдерТЗ = Новый Провайдер;
	ПровайдерТЗ.Источник = ПолучитьТЗ();
	
	Поле1 = Форма.Элементы.Добавить("ТаблицаФормы1", "ТаблицаФормы", Неопределено);
	Поле1.ПутьКДанным = ПровайдерТЗ;
	Поле1.Заголовок = "Провайдер - ТЗ";
	Поле1.ПоложениеЗаголовка = УправляемыйИнтерфейс.ПоложениеЗаголовка.Верх;
	Поле1.Закрепление = 5;
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриПотереФокусаЯчейки", "ПриПотереФокусаЯчейки");
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриДвойномКлике", "ПриДвойномКлике");
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриВыборе", "ПриВыборе");
	
	
	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("ТаблицаФормы1"), Неопределено);
	
	Форма.Показать();	
КонецПроцедуры

//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

Инициализация();
