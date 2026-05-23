import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'be';

  static String m0(of) => "Расклад ${of}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "schedule": MessageLookupByLibrary.simpleMessage("Расклад"),
        "home": MessageLookupByLibrary.simpleMessage("Галоўная"),
        "teacher": MessageLookupByLibrary.simpleMessage("Выкладчык"),
        "auditories": MessageLookupByLibrary.simpleMessage("Аўдыторыі"),
        "settings": MessageLookupByLibrary.simpleMessage("Наладкі"),
        "empty": MessageLookupByLibrary.simpleMessage("Нічога не знойдзена"),
        "inviteScreenTitle":
            MessageLookupByLibrary.simpleMessage("Расклад АККПРБ"),
        "welcomeText":
            MessageLookupByLibrary.simpleMessage("Вітаем\nВыберыце вашу групу"),
        "confirmButton": MessageLookupByLibrary.simpleMessage("Пацвердзіць"),
        "scheduleOf": m0,
        "emptyLessons": MessageLookupByLibrary.simpleMessage("Пар сёння няма"),
        "clearCache": MessageLookupByLibrary.simpleMessage("Ачысціць кэш"),
        "changeGroup": MessageLookupByLibrary.simpleMessage("Змяніць групу"),
        "theme": MessageLookupByLibrary.simpleMessage("Тэма"),
        "system": MessageLookupByLibrary.simpleMessage("Сістэмная"),
        "light": MessageLookupByLibrary.simpleMessage("Светлая"),
        "dark": MessageLookupByLibrary.simpleMessage("Цёмная"),
        "teachers": MessageLookupByLibrary.simpleMessage("Выкладчыкі"),
        "noTeachers":
            MessageLookupByLibrary.simpleMessage("Адсутнічае спіс выкладчыкаў"),
        "scientificWorks": MessageLookupByLibrary.simpleMessage(
            "Навуковыя працы і публікацыі"),
        "grades": MessageLookupByLibrary.simpleMessage("Паспяховасць"),
        "addWork": MessageLookupByLibrary.simpleMessage("Дадаць працу"),
        "addPublication":
            MessageLookupByLibrary.simpleMessage("Дадаць публікацыю"),
        "addDiscipline":
            MessageLookupByLibrary.simpleMessage("Дадаць дысцыпліну"),
        "workTitle": MessageLookupByLibrary.simpleMessage("Назва"),
        "workType": MessageLookupByLibrary.simpleMessage("Тып"),
        "workDate": MessageLookupByLibrary.simpleMessage("Дата"),
        "workDescription": MessageLookupByLibrary.simpleMessage("Апісанне"),
        "discipline": MessageLookupByLibrary.simpleMessage("Дысцыпліна"),
        "note": MessageLookupByLibrary.simpleMessage("Нататка"),
        "semester": MessageLookupByLibrary.simpleMessage("Семестр"),
        "coursesNumber": MessageLookupByLibrary.simpleMessage("Нумар курса"),
        "additionalNote":
            MessageLookupByLibrary.simpleMessage("Дадатковая нататка"),
        "averageGrade": MessageLookupByLibrary.simpleMessage("Сярэдні бал"),
        "noWorksYet":
            MessageLookupByLibrary.simpleMessage("Навуковых прац пакуль няма"),
        "noGradesYet":
            MessageLookupByLibrary.simpleMessage("Ацэнак пакуль няма"),
        "deleteWork":
            MessageLookupByLibrary.simpleMessage("Выдаліць гэтую працу?"),
        "deleteDiscipline":
            MessageLookupByLibrary.simpleMessage("Выдаліць гэтую дысцыпліну?"),
        "article": MessageLookupByLibrary.simpleMessage("Артыкул"),
        "conference": MessageLookupByLibrary.simpleMessage("Канферэнцыя"),
        "monograph": MessageLookupByLibrary.simpleMessage("Манаграфія"),
        "other": MessageLookupByLibrary.simpleMessage("Іншае"),
        "grade": MessageLookupByLibrary.simpleMessage("Ацэнка"),
        "gradeScale": MessageLookupByLibrary.simpleMessage("Ацэнка (1-10)"),
        "createdWork": MessageLookupByLibrary.simpleMessage("Праца створана"),
        "createdDiscipline":
            MessageLookupByLibrary.simpleMessage("Дысцыпліна дададзена"),
        "workDeleted": MessageLookupByLibrary.simpleMessage("Праца выдалена"),
        "disciplineDeleted":
            MessageLookupByLibrary.simpleMessage("Дысцыпліна выдалена"),
        "emptyWorkTitle":
            MessageLookupByLibrary.simpleMessage("Назва не можа быць пустой"),
        "emptyDisciplineName": MessageLookupByLibrary.simpleMessage(
            "Назва дысцыпліны не можа быць пустой"),
        "emptyGrade":
            MessageLookupByLibrary.simpleMessage("Ацэнка не можа быць пустой"),
        "invalidGrade": MessageLookupByLibrary.simpleMessage(
            "Ацэнка павінна быць ад 1 да 10"),
        "hometasks": MessageLookupByLibrary.simpleMessage("Дамашнія заданні"),
        "toComplete": MessageLookupByLibrary.simpleMessage("Да выканання"),
        "completed": MessageLookupByLibrary.simpleMessage("Выканана"),
        "today": MessageLookupByLibrary.simpleMessage("Сёння"),
        "thereIsNotCompTask":
            MessageLookupByLibrary.simpleMessage("Няма выкананых задач"),
        "thereIsNotTask":
            MessageLookupByLibrary.simpleMessage("Задач пакуль няма"),
        "addNewTask": MessageLookupByLibrary.simpleMessage("Дадаць задачу"),
        "taskTitle": MessageLookupByLibrary.simpleMessage("Назва задачы"),
        "notes": MessageLookupByLibrary.simpleMessage("Нататкі"),
        "createdTask": MessageLookupByLibrary.simpleMessage("Задача створана"),
        "emptyTitle":
            MessageLookupByLibrary.simpleMessage("Назва не можа быць пустой"),
        "taskDeleted": MessageLookupByLibrary.simpleMessage("Задача выдалена"),
        "taskDeleteAlert":
            MessageLookupByLibrary.simpleMessage("Выдаліць гэтую задачу?"),
        "taskIncompl": MessageLookupByLibrary.simpleMessage(
            "Задача адзначана як нявыкананая"),
        "taskCompleted":
            MessageLookupByLibrary.simpleMessage("Задача выканана"),
        "menu": MessageLookupByLibrary.simpleMessage("Меню"),
        "teachersAndClasses":
            MessageLookupByLibrary.simpleMessage("Выкладчыкі і класы"),
        "canteen": MessageLookupByLibrary.simpleMessage("Сталовая"),
        "services": MessageLookupByLibrary.simpleMessage("Сэрвісы"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("Аб прыкладанні"),
        "numOfGroup": MessageLookupByLibrary.simpleMessage("Нумар групы"),
        "totalGroups": MessageLookupByLibrary.simpleMessage("Усяго груп"),
        "chooseExcel":
            MessageLookupByLibrary.simpleMessage("Выберыце файл Excel"),
        "ok": MessageLookupByLibrary.simpleMessage("Ок"),
        "cancel": MessageLookupByLibrary.simpleMessage("Адмена"),
        "yes": MessageLookupByLibrary.simpleMessage("Так"),
        "no": MessageLookupByLibrary.simpleMessage("Не"),
        "step": MessageLookupByLibrary.simpleMessage("Крок"),
        "step1": MessageLookupByLibrary.simpleMessage(
            "Спампуйце гатовы расклад з нашага тэлеграм канала!"),
        "step2": MessageLookupByLibrary.simpleMessage(
            "Выберыце нумар вашай групы і колькасць груп у вашым патоку."),
        "step3": MessageLookupByLibrary.simpleMessage(
            "Націсніце Выберыце файл Excel і выберыце спампаваны расклад."),
        "step4": MessageLookupByLibrary.simpleMessage(
            "Націсніце Ок і атрымлівайце асалоду ад прыкладання!"),
        "pass": MessageLookupByLibrary.simpleMessage("Далей"),
        "cacheDeleted": MessageLookupByLibrary.simpleMessage("Кэш выдалены"),
        "language": MessageLookupByLibrary.simpleMessage("Мова"),
        "languageChanged": MessageLookupByLibrary.simpleMessage(
            "Мова зменена. Перазапусціце прыкладанне"),
        "main": MessageLookupByLibrary.simpleMessage("Важнае"),
        "website": MessageLookupByLibrary.simpleMessage("Сайт"),
        "websiteDesc": MessageLookupByLibrary.simpleMessage(
            "Знайдзіце патрэбную інфармацыю"),
        "moodleDesc":
            MessageLookupByLibrary.simpleMessage("Даведайцеся свае заданні"),
        "ilexDesc": MessageLookupByLibrary.simpleMessage(
            "Будзьце ў курсе новых законаў"),
        "communities": MessageLookupByLibrary.simpleMessage("Супольнасці"),
        "aupprbChannel": MessageLookupByLibrary.simpleMessage("Расклад АККПРБ"),
        "aupprbChannelDesc": MessageLookupByLibrary.simpleMessage(
            "Тэлеграм канал з гатовымі Excel файламі"),
        "studSovet":
            MessageLookupByLibrary.simpleMessage("Студэнцкі савет АККПРБ"),
        "studSovetDesc": MessageLookupByLibrary.simpleMessage(
            "Афіцыйная група студэнцкага савета АККПРБ"),
        "profsouz":
            MessageLookupByLibrary.simpleMessage("Прафсаюз студэнтаў АККПРБ"),
        "profsouzDesc": MessageLookupByLibrary.simpleMessage(
            "Першасная прафсаюзная арганізацыя студэнтаў Акадэміі"),
        "brsm": MessageLookupByLibrary.simpleMessage("БРСМ АККПРБ"),
        "brsmDesc":
            MessageLookupByLibrary.simpleMessage("Першасная арганізацыя БРСМ"),
        "aupprbChannelDes": MessageLookupByLibrary.simpleMessage(
            "Тэлеграм канал з гатовымі Excel файламі"),
        "time": MessageLookupByLibrary.simpleMessage("Час"),
        "date": MessageLookupByLibrary.simpleMessage("Дата"),
        "taskToBeCompletedOn": MessageLookupByLibrary.simpleMessage(
            "Задача павінна быць выканана "),
        "noAdditionalNote": MessageLookupByLibrary.simpleMessage(
            "Няма дадатковай нататкі для гэтай задачы"),
        "emptyCanteen":
            MessageLookupByLibrary.simpleMessage("Сталовая закрыта сёння"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Паспрабаваць зноў"),
        "checkConn": MessageLookupByLibrary.simpleMessage(
            "Няма падключэння да інтэрнэту."),
        "developers": MessageLookupByLibrary.simpleMessage("Распрацоўшчыкі"),
        "add": MessageLookupByLibrary.simpleMessage("Дадаць"),
        "price": MessageLookupByLibrary.simpleMessage("Кошт"),
        "cart": MessageLookupByLibrary.simpleMessage("Кошык"),
        "quantity": MessageLookupByLibrary.simpleMessage("Колькасць"),
        "total": MessageLookupByLibrary.simpleMessage("Усяго"),
        "studDiscount":
            MessageLookupByLibrary.simpleMessage("Студэнцкая скідка"),
        "studentDisc":
            MessageLookupByLibrary.simpleMessage("Студэнцкая скідка"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыць"),
        "clear": MessageLookupByLibrary.simpleMessage("Ачысціць"),
        "portion": MessageLookupByLibrary.simpleMessage("Порцыя"),
        "appVersion":
            MessageLookupByLibrary.simpleMessage("Версія прыкладання"),
        "buildNum": MessageLookupByLibrary.simpleMessage("Нумар зборкі"),
        "messageAboutApp": MessageLookupByLibrary.simpleMessage(
            "Гэта прыкладанне цалкам бясплатнае і з адкрытым зыходным кодам."),
        "developedBy":
            MessageLookupByLibrary.simpleMessage("Прыкладанне распрацавана"),
        "vlad": MessageLookupByLibrary.simpleMessage("Уладзіслаў Панамарэнка"),
        "and": MessageLookupByLibrary.simpleMessage(" і "),
        "andron": MessageLookupByLibrary.simpleMessage("Андрэй Суслоў"),
        "group": MessageLookupByLibrary.simpleMessage("Група"),
        "menuDoesntWork": MessageLookupByLibrary.simpleMessage(
            "Меню сталовай больш не даступна"),
        "headerChanged": MessageLookupByLibrary.simpleMessage(
            "Кіраўніцтва сталовай змянілася."),
        "lection": MessageLookupByLibrary.simpleMessage("Тып: Лекцыя"),
        "credit": MessageLookupByLibrary.simpleMessage("Тып: Залік"),
        "curHour":
            MessageLookupByLibrary.simpleMessage("Тып: Куратарскі гадзіну"),
        "practLesson":
            MessageLookupByLibrary.simpleMessage("Тып: Практычнае заняткі"),
        "appIcon": MessageLookupByLibrary.simpleMessage(
            "За іконку прыкладання дзякуй "),
        "tanya": MessageLookupByLibrary.simpleMessage("Таццяне Голубевай"),
        "canteenMenu": MessageLookupByLibrary.simpleMessage("Меню сталовай"),
        "noData": MessageLookupByLibrary.simpleMessage("Няма дадзеных"),
        "fullName": MessageLookupByLibrary.simpleMessage("Поўнае імя"),
        "attestationForm":
            MessageLookupByLibrary.simpleMessage("Форма атэстацыі"),
        "welcome": MessageLookupByLibrary.simpleMessage("Вітаем!"),
        "checkSchedule":
            MessageLookupByLibrary.simpleMessage("Праверце расклад!"),
        "beInKnown":
            MessageLookupByLibrary.simpleMessage("Будзьце заўсёды ў курсе!"),
        "exploreToUse": MessageLookupByLibrary.simpleMessage(
            "Даведайцеся як выкарыстоўваць!"),
        "errorTellDevs": MessageLookupByLibrary.simpleMessage(
            "Памылка. Паведаміце распрацоўшчыкам"),
        "twoWeeks": MessageLookupByLibrary.simpleMessage("Два тыдні"),
        "week": MessageLookupByLibrary.simpleMessage("Тыдзень"),
        "errorText": MessageLookupByLibrary.simpleMessage("Трэба выбраць файл"),
      };
}
