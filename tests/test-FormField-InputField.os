#Использовать asserts

Перем юТест;
Перем ВидыПоляФормы;
Перем ПоложенияЗаголовка;
Перем ТекстПриИзменении;

Процедура Инициализация()

КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	юТест = Тестирование;

	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_СоздатьТекстовоеПоле");
	СписокТестов.Добавить("Тест_Должен_ПровестиРаботуСоЗначением");
	СписокТестов.Добавить("Тест_Должен_УстановитьЗаголовок");
	СписокТестов.Добавить("Тест_Должен_УстановитьИмя");
	СписокТестов.Добавить("Тест_Должен_УстановитьВидимость");
	СписокТестов.Добавить("Тест_Должен_УстановитьДоступность");
	СписокТестов.Добавить("Тест_Должен_ВернутьРодителя");
	СписокТестов.Добавить("Тест_Должен_УстановитьТолькоПросмотр");
	СписокТестов.Добавить("Тест_Должен_ПроверитьПоложениеЗаголовка");
	
	СписокТестов.Добавить("Тест_Должен_УстановитьИПроверитьДействиеПриИзмении");
	СписокТестов.Добавить("Тест_Должен_ПолучитьДействие");
	
	Возврат СписокТестов;

КонецФункции

Функция ПолучитьФорму()

	ПодключитьВнешнююКомпоненту("oscript-component/bin/Release/oscript-simple-gui.dll");
	ПростойГУИ = Новый ПростойГУИ();
	Форма = ПростойГУИ.СоздатьФорму();

	ВидыПоляФормы = Форма.ВидПоляФормы;
	ПоложенияЗаголовка = Форма.ПоложениеЗаголовка;

	Возврат Форма;

КонецФункции

Процедура Тест_Должен_СоздатьТекстовоеПоле() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();	

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;

	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("Поле1"), Неопределено);

КонецПроцедуры

Процедура Тест_Должен_ПровестиРаботуСоЗначением() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();	

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.Значение = "ПроверкаЗначения";

	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").Значение, "ПроверкаЗначения");

КонецПроцедуры

Процедура Тест_Должен_УстановитьЗаголовок() Экспорт

	НовыйЗаголовок = "Новый заголовок";

	Форма = ПолучитьФорму();
	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.Заголовок = НовыйЗаголовок;
	Форма.ПоказатьНеМодально();

	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").Заголовок, НовыйЗаголовок);

КонецПроцедуры

Процедура Тест_Должен_УстановитьИмя() Экспорт

	НовоеИмя = "НовоеИмя";

	Форма = ПолучитьФорму();
	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.Имя = НовоеИмя;
	Форма.ПоказатьНеМодально();

	юТест.ПроверитьРавенство(Форма.Элементы.Найти(НовоеИмя).Имя, НовоеИмя);
КонецПроцедуры

Процедура Тест_Должен_УстановитьВидимость() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.Видимость = Истина;
	юТест.ПроверитьРавенство(Поле1.Visible, Истина);

	Поле1.Видимость = Ложь;
	юТест.ПроверитьРавенство(Поле1.Visible, Ложь);
	
КонецПроцедуры

Процедура Тест_Должен_УстановитьДоступность() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.Доступность = Истина;

	юТест.ПроверитьРавенство(Поле1.Enabled, Истина);

	Поле1.Доступность = Ложь;
	юТест.ПроверитьРавенство(Поле1.Enabled, Ложь);
	
КонецПроцедуры

Процедура Тест_Должен_ВернутьРодителя() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;

	юТест.ПроверитьРавенство(Строка(Форма.Элементы.Найти("Поле1").Родитель), "УправляемаяФорма");

	Группа = Форма.Элементы.Добавить("Группа", "ГруппаФормы", Неопределено);

	Поле2 = Форма.Элементы.Добавить("Поле2", "ПолеФормы", Группа);
	юТест.ПроверитьРавенство(Строка(Форма.Элементы.Найти("Поле2").Родитель), "ГруппаФормы");
	
КонецПроцедуры

Процедура Тест_Должен_УстановитьТолькоПросмотр() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.ТолькоПросмотр = Истина;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ReadOnly, Истина);

	Поле1.ТолькоПросмотр = Ложь;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ReadOnly, Ложь);
	
КонецПроцедуры

Процедура Тест_Должен_ПроверитьПоложениеЗаголовка() Экспорт

	Форма = ПолучитьФорму();
	Форма.ПоказатьНеМодально();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Авто;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Авто);

	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Верх;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Верх);

	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Лево;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Лево);

	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Нет;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Нет);

	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Низ;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Низ);

	Поле1.ПоложениеЗаголовка = ПоложенияЗаголовка.Право;
	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").ПоложениеЗаголовка, ПоложенияЗаголовка.Право);


КонецПроцедуры


//# Работа с событиями
Процедура ПриИзменииЗначения() Экспорт
	ТекстПриИзменении = "Новое значение: ";
КонецПроцедуры

Процедура Тест_Должен_УстановитьИПроверитьДействиеПриИзмении() Экспорт
	Форма = ПолучитьФорму();
	
	ТекстПриИзменении = "Исходный текст: ";

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзменииЗначения");
	Поле1.Значение = "Произвольный текст";

	юТест.ПроверитьРавенство(ТекстПриИзменении + Форма.Элементы.Найти("Поле1").Значение, "Новое значение: Произвольный текст");

	Форма.ПоказатьНеМодально();
	//Форма.Показать();

КонецПроцедуры

Процедура Тест_Должен_ПолучитьДействие() Экспорт
	Форма = ПолучитьФорму();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеВвода;
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзменииЗначения");

	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("Поле1").ПолучитьДействие("ПриИзменении"), "");

	Форма.ПоказатьНеМодально();

КонецПроцедуры

//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

Инициализация();
