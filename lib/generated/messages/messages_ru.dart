import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(of) => "Расписание ${of}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "schedule": MessageLookupByLibrary.simpleMessage("Расписание"),
        "home": MessageLookupByLibrary.simpleMessage("Дом"),
        "teacher": MessageLookupByLibrary.simpleMessage("Препод"),
        "auditories": MessageLookupByLibrary.simpleMessage("Аудитории"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "empty": MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
        "inviteScreenTitle":
            MessageLookupByLibrary.simpleMessage("Расписание АУППРБ"),
        "welcomeText": MessageLookupByLibrary.simpleMessage(
            "Добро пожаловать\nВведите ваш номер группы"),
        "confirmButton": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "scheduleOf": m0,
        "emptyLessons": MessageLookupByLibrary.simpleMessage(
            "Пар сегодня нет, можете расслабиться"),
        "clearCache": MessageLookupByLibrary.simpleMessage("Очистить кэш"),
        "changeGroup": MessageLookupByLibrary.simpleMessage("Изменить группу"),
        "theme": MessageLookupByLibrary.simpleMessage("Тема"),
        "system": MessageLookupByLibrary.simpleMessage("Системная"),
        "light": MessageLookupByLibrary.simpleMessage("Светлая"),
        "dark": MessageLookupByLibrary.simpleMessage("Темная"),
        "teachers": MessageLookupByLibrary.simpleMessage("Преподаватели"),
        "noTeachers": MessageLookupByLibrary.simpleMessage(
            "Отсутствует список преподавателей"),
        "scientificWorks":
            MessageLookupByLibrary.simpleMessage("Научные работы и публикации"),
        "grades": MessageLookupByLibrary.simpleMessage("Успеваемость"),
        "addWork": MessageLookupByLibrary.simpleMessage("Добавить работу"),
        "addPublication":
            MessageLookupByLibrary.simpleMessage("Добавить публикацию"),
        "addDiscipline":
            MessageLookupByLibrary.simpleMessage("Добавить дисциплину"),
        "workTitle": MessageLookupByLibrary.simpleMessage("Название"),
        "workType": MessageLookupByLibrary.simpleMessage("Тип"),
        "workDate": MessageLookupByLibrary.simpleMessage("Дата"),
        "workDescription": MessageLookupByLibrary.simpleMessage("Описание"),
        "discipline": MessageLookupByLibrary.simpleMessage("Дисциплина"),
        "note": MessageLookupByLibrary.simpleMessage("Заметка"),
        "semester": MessageLookupByLibrary.simpleMessage("Семестр"),
        "coursesNumber":
            MessageLookupByLibrary.simpleMessage("Количество курсов"),
        "additionalNote":
            MessageLookupByLibrary.simpleMessage("Дополнительная заметка"),
        "averageGrade": MessageLookupByLibrary.simpleMessage("Средний балл"),
        "noWorksYet":
            MessageLookupByLibrary.simpleMessage("Научных работ пока нет"),
        "noGradesYet": MessageLookupByLibrary.simpleMessage("Оценок пока нет"),
        "deleteWork":
            MessageLookupByLibrary.simpleMessage("Удалить эту работу?"),
        "deleteDiscipline":
            MessageLookupByLibrary.simpleMessage("Удалить эту дисциплину?"),
        "article": MessageLookupByLibrary.simpleMessage("Статья"),
        "conference": MessageLookupByLibrary.simpleMessage("Конференция"),
        "monograph": MessageLookupByLibrary.simpleMessage("Монография"),
        "other": MessageLookupByLibrary.simpleMessage("Другое"),
        "grade": MessageLookupByLibrary.simpleMessage("Оценка"),
        "gradeScale": MessageLookupByLibrary.simpleMessage("Оценка (1-10)"),
        "createdWork": MessageLookupByLibrary.simpleMessage("Работа создана"),
        "createdDiscipline":
            MessageLookupByLibrary.simpleMessage("Дисциплина добавлена"),
        "workDeleted": MessageLookupByLibrary.simpleMessage("Работа удалена"),
        "disciplineDeleted":
            MessageLookupByLibrary.simpleMessage("Дисциплина удалена"),
        "emptyWorkTitle": MessageLookupByLibrary.simpleMessage(
            "Название не может быть пустым"),
        "emptyDisciplineName": MessageLookupByLibrary.simpleMessage(
            "Название дисциплины не может быть пустым"),
        "emptyGrade":
            MessageLookupByLibrary.simpleMessage("Оценка не может быть пустой"),
        "invalidGrade": MessageLookupByLibrary.simpleMessage(
            "Оценка должна быть от 1 до 10"),
        "hometasks": MessageLookupByLibrary.simpleMessage("Домашние задания"),
        "toComplete": MessageLookupByLibrary.simpleMessage("К выполнению"),
        "completed": MessageLookupByLibrary.simpleMessage("Выполнено"),
        "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "thereIsNotCompTask":
            MessageLookupByLibrary.simpleMessage("Нет выполненных задач"),
        "thereIsNotTask":
            MessageLookupByLibrary.simpleMessage("Задач пока нет"),
        "addNewTask": MessageLookupByLibrary.simpleMessage("Добавить задачу"),
        "taskTitle": MessageLookupByLibrary.simpleMessage("Название задачи"),
        "notes": MessageLookupByLibrary.simpleMessage("Заметки"),
        "createdTask": MessageLookupByLibrary.simpleMessage("Задача создана"),
        "emptyTitle": MessageLookupByLibrary.simpleMessage(
            "Название не может быть пустым"),
        "taskDeleted": MessageLookupByLibrary.simpleMessage("Задача удалена"),
        "taskDeleteAlert":
            MessageLookupByLibrary.simpleMessage("Удалить эту задачу?"),
        "taskIncompl": MessageLookupByLibrary.simpleMessage(
            "Задача отмечена как невыполненная"),
        "taskCompleted":
            MessageLookupByLibrary.simpleMessage("Задача выполнена"),
        "menu": MessageLookupByLibrary.simpleMessage("Меню"),
        "teachersAndClasses":
            MessageLookupByLibrary.simpleMessage("Преподаватели и классы"),
        "canteen": MessageLookupByLibrary.simpleMessage("Столовая"),
        "services": MessageLookupByLibrary.simpleMessage("Сервисы"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("О приложении"),
        "numOfGroup": MessageLookupByLibrary.simpleMessage("Номер группы"),
        "totalGroups": MessageLookupByLibrary.simpleMessage("Всего групп"),
        "chooseExcel":
            MessageLookupByLibrary.simpleMessage("Выберите файл Excel"),
        "ok": MessageLookupByLibrary.simpleMessage("Ок"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "yes": MessageLookupByLibrary.simpleMessage("Да"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "step": MessageLookupByLibrary.simpleMessage("Шаг"),
        "step1": MessageLookupByLibrary.simpleMessage(
            "Скачайте готовое расписание из нашего телеграм канала!"),
        "step2": MessageLookupByLibrary.simpleMessage(
            "Выберите номер вашей группы и количество групп в вашем потоке."),
        "step3": MessageLookupByLibrary.simpleMessage(
            "Нажмите Выберите файл Excel и выберите скачанное расписание."),
        "step4": MessageLookupByLibrary.simpleMessage(
            "Нажмите Ок и наслаждайтесь приложением!"),
        "pass": MessageLookupByLibrary.simpleMessage("Далее"),
        "cacheDeleted": MessageLookupByLibrary.simpleMessage("Кэш удален"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "languageChanged": MessageLookupByLibrary.simpleMessage(
            "Язык изменен. Перезапустите приложение"),
        "main": MessageLookupByLibrary.simpleMessage("Важное"),
        "website": MessageLookupByLibrary.simpleMessage("Сайт"),
        "websiteDesc":
            MessageLookupByLibrary.simpleMessage("Найдите нужную информацию"),
        "moodleDesc":
            MessageLookupByLibrary.simpleMessage("Узнайте свои задания"),
        "ilexDesc": MessageLookupByLibrary.simpleMessage(
            "Будьте в курсе новых законов"),
        "communities": MessageLookupByLibrary.simpleMessage("Сообщества"),
        "aupprbChannel":
            MessageLookupByLibrary.simpleMessage("Расписание АУППРБ"),
        "aupprbChannelDesc": MessageLookupByLibrary.simpleMessage(
            "Телеграм канал с готовыми Excel файлами"),
        "studSovet":
            MessageLookupByLibrary.simpleMessage("Студенческий совет АУППРБ"),
        "studSovetDesc": MessageLookupByLibrary.simpleMessage(
            "Официальная группа студенческого совета АУППРБ"),
        "profsouz":
            MessageLookupByLibrary.simpleMessage("Профсоюз студентов АУППРБ"),
        "profsouzDesc": MessageLookupByLibrary.simpleMessage(
            "Первичная профсоюзная организация студентов Академии"),
        "brsm": MessageLookupByLibrary.simpleMessage("БРСМ АУППРБ"),
        "brsmDesc":
            MessageLookupByLibrary.simpleMessage("Первичная организация БРСМ"),
        "aupprbChannelDes": MessageLookupByLibrary.simpleMessage(
            "Телеграм канал с готовыми Excel файлами"),
        "time": MessageLookupByLibrary.simpleMessage("Время"),
        "date": MessageLookupByLibrary.simpleMessage("Дата"),
        "taskToBeCompletedOn": MessageLookupByLibrary.simpleMessage(
            "Задача должна быть выполнена "),
        "noAdditionalNote": MessageLookupByLibrary.simpleMessage(
            "Нет дополнительной заметки для этой задачи"),
        "emptyCanteen":
            MessageLookupByLibrary.simpleMessage("Столовая закрыта сегодня"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Попробовать снова"),
        "checkConn": MessageLookupByLibrary.simpleMessage(
            "Нет подключения к интернету."),
        "developers": MessageLookupByLibrary.simpleMessage("Разработчики"),
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "price": MessageLookupByLibrary.simpleMessage("Цена"),
        "cart": MessageLookupByLibrary.simpleMessage("Корзина"),
        "quantity": MessageLookupByLibrary.simpleMessage("Количество"),
        "total": MessageLookupByLibrary.simpleMessage("Итого"),
        "studDiscount":
            MessageLookupByLibrary.simpleMessage("Студенческая скидка"),
        "studentDisc":
            MessageLookupByLibrary.simpleMessage("Студенческая скидка"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистить"),
        "portion": MessageLookupByLibrary.simpleMessage("Порция"),
        "appVersion": MessageLookupByLibrary.simpleMessage("Версия приложения"),
        "buildNum": MessageLookupByLibrary.simpleMessage("Номер сборки"),
        "messageAboutApp": MessageLookupByLibrary.simpleMessage(
            "Это приложение полностью бесплатно и с открытым исходным кодом."),
        "developedBy":
            MessageLookupByLibrary.simpleMessage("Приложение разработано"),
        "vlad": MessageLookupByLibrary.simpleMessage("Владислав Пономаренко"),
        "and": MessageLookupByLibrary.simpleMessage(" и "),
        "andron": MessageLookupByLibrary.simpleMessage("Андрей Суслов"),
        "group": MessageLookupByLibrary.simpleMessage("Группа"),
        "menuDoesntWork": MessageLookupByLibrary.simpleMessage(
            "Меню столовой больше не доступно"),
        "headerChanged": MessageLookupByLibrary.simpleMessage(
            "Руководство столовой изменилось."),
        "lection": MessageLookupByLibrary.simpleMessage("Тип: Лекция"),
        "credit": MessageLookupByLibrary.simpleMessage("Тип: Зачет"),
        "curHour": MessageLookupByLibrary.simpleMessage("Тип: Кураторский час"),
        "practLesson":
            MessageLookupByLibrary.simpleMessage("Тип: Практическое занятие"),
        "appIcon": MessageLookupByLibrary.simpleMessage(
            "За иконку приложения спасибо "),
        "tanya": MessageLookupByLibrary.simpleMessage("Татьяне Голубевой"),
        "canteenMenu": MessageLookupByLibrary.simpleMessage("Меню столовой"),
        "noData": MessageLookupByLibrary.simpleMessage("Нет данных"),
        "fullName": MessageLookupByLibrary.simpleMessage("Полное имя"),
        "attestationForm":
            MessageLookupByLibrary.simpleMessage("Форма аттестации"),
        "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать!"),
        "checkSchedule":
            MessageLookupByLibrary.simpleMessage("Проверьте расписание!"),
        "beInKnown":
            MessageLookupByLibrary.simpleMessage("Будьте всегда в курсе!"),
        "exploreToUse":
            MessageLookupByLibrary.simpleMessage("Узнайте как использовать!"),
        "errorTellDevs": MessageLookupByLibrary.simpleMessage(
            "Ошибка. Сообщите разработчикам"),
        "twoWeeks": MessageLookupByLibrary.simpleMessage("Две недели"),
        "week": MessageLookupByLibrary.simpleMessage("Неделя"),
        "errorText": MessageLookupByLibrary.simpleMessage("Нужно выбрать файл"),
      };
}
