import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(of) => "Schedule of ${of}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "schedule": MessageLookupByLibrary.simpleMessage("Schedule"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "teacher": MessageLookupByLibrary.simpleMessage("Teacher"),
        "auditories": MessageLookupByLibrary.simpleMessage("Audiences"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "empty": MessageLookupByLibrary.simpleMessage("Nothing found"),
        "inviteScreenTitle":
            MessageLookupByLibrary.simpleMessage("The schedule of )"),
        "welcomeText": MessageLookupByLibrary.simpleMessage(
            "Welcome\nEnter your group number"),
        "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
        "scheduleOf": m0,
        "emptyLessons": MessageLookupByLibrary.simpleMessage(
            "There are no classes today, you can relax"),
        "clearCache": MessageLookupByLibrary.simpleMessage("Clear Cache"),
        "changeGroup": MessageLookupByLibrary.simpleMessage("Change Group"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "teachers": MessageLookupByLibrary.simpleMessage("Teachers"),
        "noTeachers": MessageLookupByLibrary.simpleMessage(
            "There is no list of teachers"),
        "scientificWorks": MessageLookupByLibrary.simpleMessage(
            "Scientific Works & Publications"),
        "grades": MessageLookupByLibrary.simpleMessage("Academic Performance"),
        "addWork": MessageLookupByLibrary.simpleMessage("Add Work"),
        "addPublication":
            MessageLookupByLibrary.simpleMessage("Add Publication"),
        "addDiscipline": MessageLookupByLibrary.simpleMessage("Add Discipline"),
        "workTitle": MessageLookupByLibrary.simpleMessage("Title"),
        "workType": MessageLookupByLibrary.simpleMessage("Type"),
        "workDate": MessageLookupByLibrary.simpleMessage("Date"),
        "workDescription": MessageLookupByLibrary.simpleMessage("Description"),
        "discipline": MessageLookupByLibrary.simpleMessage("Discipline"),
        "note": MessageLookupByLibrary.simpleMessage("Note"),
        "semester": MessageLookupByLibrary.simpleMessage("Semester"),
        "coursesNumber": MessageLookupByLibrary.simpleMessage("Courses Number"),
        "additionalNote":
            MessageLookupByLibrary.simpleMessage("Additional Note"),
        "averageGrade": MessageLookupByLibrary.simpleMessage("Average Grade"),
        "noWorksYet":
            MessageLookupByLibrary.simpleMessage("No scientific works yet"),
        "noGradesYet": MessageLookupByLibrary.simpleMessage("No grades yet"),
        "deleteWork": MessageLookupByLibrary.simpleMessage("Delete this work?"),
        "deleteDiscipline":
            MessageLookupByLibrary.simpleMessage("Delete this discipline?"),
        "article": MessageLookupByLibrary.simpleMessage("Article"),
        "conference": MessageLookupByLibrary.simpleMessage("Conference"),
        "monograph": MessageLookupByLibrary.simpleMessage("Monograph"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "grade": MessageLookupByLibrary.simpleMessage("Grade"),
        "gradeScale": MessageLookupByLibrary.simpleMessage("Grade (1-10)"),
        "createdWork": MessageLookupByLibrary.simpleMessage("Work created"),
        "createdDiscipline":
            MessageLookupByLibrary.simpleMessage("Discipline added"),
        "workDeleted": MessageLookupByLibrary.simpleMessage("Work deleted"),
        "disciplineDeleted":
            MessageLookupByLibrary.simpleMessage("Discipline deleted"),
        "emptyWorkTitle":
            MessageLookupByLibrary.simpleMessage("Title cannot be empty"),
        "emptyDisciplineName": MessageLookupByLibrary.simpleMessage(
            "Discipline name cannot be empty"),
        "emptyGrade":
            MessageLookupByLibrary.simpleMessage("Grade cannot be empty"),
        "invalidGrade": MessageLookupByLibrary.simpleMessage(
            "Grade must be between 1 and 10"),
        "hometasks": MessageLookupByLibrary.simpleMessage("Hometasks"),
        "toComplete": MessageLookupByLibrary.simpleMessage("To Complete"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "thereIsNotCompTask":
            MessageLookupByLibrary.simpleMessage("No completed tasks"),
        "thereIsNotTask": MessageLookupByLibrary.simpleMessage("No tasks yet"),
        "addNewTask": MessageLookupByLibrary.simpleMessage("Add New Task"),
        "taskTitle": MessageLookupByLibrary.simpleMessage("Task Title"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "createdTask": MessageLookupByLibrary.simpleMessage("Task created"),
        "emptyTitle":
            MessageLookupByLibrary.simpleMessage("Title cannot be empty"),
        "taskDeleted": MessageLookupByLibrary.simpleMessage("Task deleted"),
        "taskDeleteAlert":
            MessageLookupByLibrary.simpleMessage("Delete this task?"),
        "taskIncompl":
            MessageLookupByLibrary.simpleMessage("Task marked as incomplete"),
        "taskCompleted": MessageLookupByLibrary.simpleMessage("Task completed"),
        "menu": MessageLookupByLibrary.simpleMessage("Menu"),
        "teachersAndClasses":
            MessageLookupByLibrary.simpleMessage("Teachers and Classes"),
        "canteen": MessageLookupByLibrary.simpleMessage("Canteen"),
        "services": MessageLookupByLibrary.simpleMessage("Services"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("About App"),
        "numOfGroup": MessageLookupByLibrary.simpleMessage("Group Number"),
        "totalGroups": MessageLookupByLibrary.simpleMessage("Total Groups"),
        "chooseExcel":
            MessageLookupByLibrary.simpleMessage("Select the Excel file"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "step": MessageLookupByLibrary.simpleMessage("Step"),
        "step1": MessageLookupByLibrary.simpleMessage(
            "Download the ready-made schedule from our telegram channel!"),
        "step2": MessageLookupByLibrary.simpleMessage(
            "Choose your group number and the number of groups on your stream."),
        "step3": MessageLookupByLibrary.simpleMessage(
            "Click on Select the Excel file and click on the schedule you downloaded."),
        "step4":
            MessageLookupByLibrary.simpleMessage("Click Ok and enjoy our app!"),
        "pass": MessageLookupByLibrary.simpleMessage("Pass"),
        "cacheDeleted":
            MessageLookupByLibrary.simpleMessage("Cache has been deleted"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languageChanged": MessageLookupByLibrary.simpleMessage(
            "Language was changed. Restart the app please"),
        "main": MessageLookupByLibrary.simpleMessage("Important"),
        "website": MessageLookupByLibrary.simpleMessage("Website"),
        "websiteDesc":
            MessageLookupByLibrary.simpleMessage("Find the info you need"),
        "moodleDesc":
            MessageLookupByLibrary.simpleMessage("Find out your assignments"),
        "ilexDesc":
            MessageLookupByLibrary.simpleMessage("Be aware of the new laws"),
        "communities": MessageLookupByLibrary.simpleMessage("Communities"),
        "aupprbChannel":
            MessageLookupByLibrary.simpleMessage("AUPPRB Schedule"),
        "aupprbChannelDesc": MessageLookupByLibrary.simpleMessage(
            "Telegram channel with ready-made Excel files"),
        "studSovet":
            MessageLookupByLibrary.simpleMessage("AUPPRB Student Council"),
        "studSovetDesc": MessageLookupByLibrary.simpleMessage(
            "An official group of the AUPPRB Student Council"),
        "profsouz":
            MessageLookupByLibrary.simpleMessage("AUPPRB Students' Union"),
        "profsouzDesc": MessageLookupByLibrary.simpleMessage(
            "Primary trade union organization of students"),
        "brsm": MessageLookupByLibrary.simpleMessage("BRSM AUPPRB"),
        "brsmDesc": MessageLookupByLibrary.simpleMessage(
            "The primary organization of the BRSM"),
        "aupprbChannelDes": MessageLookupByLibrary.simpleMessage(
            "Telegram channel with ready-made Excel files"),
        "time": MessageLookupByLibrary.simpleMessage("Time"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "taskToBeCompletedOn":
            MessageLookupByLibrary.simpleMessage("Task to be completed on "),
        "noAdditionalNote": MessageLookupByLibrary.simpleMessage(
            "There is no additional note for this task"),
        "emptyCanteen":
            MessageLookupByLibrary.simpleMessage("Canteen is closed today"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "checkConn": MessageLookupByLibrary.simpleMessage(
            "There is no internet connection."),
        "developers": MessageLookupByLibrary.simpleMessage("Developers"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "studDiscount":
            MessageLookupByLibrary.simpleMessage("Student discount"),
        "studentDisc": MessageLookupByLibrary.simpleMessage("Student discount"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "portion": MessageLookupByLibrary.simpleMessage("Portion"),
        "appVersion": MessageLookupByLibrary.simpleMessage("App version"),
        "buildNum": MessageLookupByLibrary.simpleMessage("Build number"),
        "messageAboutApp": MessageLookupByLibrary.simpleMessage(
            "This application is completely free and Open Source."),
        "developedBy":
            MessageLookupByLibrary.simpleMessage("This app was developed by"),
        "vlad": MessageLookupByLibrary.simpleMessage("Vladislav Ponomarenko"),
        "and": MessageLookupByLibrary.simpleMessage(" and "),
        "andron": MessageLookupByLibrary.simpleMessage("Andrey Suslov"),
        "group": MessageLookupByLibrary.simpleMessage("Group"),
        "menuDoesntWork": MessageLookupByLibrary.simpleMessage(
            "The canteen menu is no longer available"),
        "headerChanged": MessageLookupByLibrary.simpleMessage(
            "The canteen administration has changed."),
        "lection": MessageLookupByLibrary.simpleMessage("Type: Lection"),
        "credit": MessageLookupByLibrary.simpleMessage("Type: Credit"),
        "curHour": MessageLookupByLibrary.simpleMessage("Type: Curator hour"),
        "practLesson":
            MessageLookupByLibrary.simpleMessage("Type: Practice lesson"),
        "appIcon":
            MessageLookupByLibrary.simpleMessage("For the app icon thanks to "),
        "tanya": MessageLookupByLibrary.simpleMessage("Tatyana Golubeva"),
        "canteenMenu": MessageLookupByLibrary.simpleMessage("Canteen menu"),
        "noData": MessageLookupByLibrary.simpleMessage("No data"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
        "attestationForm":
            MessageLookupByLibrary.simpleMessage("Attestation form"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome!"),
        "checkSchedule":
            MessageLookupByLibrary.simpleMessage("Check the schedule!"),
        "beInKnown":
            MessageLookupByLibrary.simpleMessage("Be always in known!"),
        "exploreToUse":
            MessageLookupByLibrary.simpleMessage("Explore how to use!"),
        "errorTellDevs":
            MessageLookupByLibrary.simpleMessage("Error. Tell to developers"),
        "twoWeeks": MessageLookupByLibrary.simpleMessage("Two weeks"),
        "week": MessageLookupByLibrary.simpleMessage("Week"),
        "errorText":
            MessageLookupByLibrary.simpleMessage("You need to select a file"),
      };
}
