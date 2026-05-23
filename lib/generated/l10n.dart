// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree.');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get schedule => Intl.message('Schedule', name: 'schedule');
  String get home => Intl.message('Home', name: 'home');
  String get teacher => Intl.message('Teacher', name: 'teacher');
  String get auditories => Intl.message('Audiences', name: 'auditories');
  String get settings => Intl.message('Settings', name: 'settings');
  String get empty => Intl.message('Nothing found', name: 'empty');
  String get inviteScreenTitle =>
      Intl.message('The schedule of )', name: 'inviteScreenTitle');
  String get welcomeText =>
      Intl.message('Welcome\nEnter your group number', name: 'welcomeText');
  String get confirmButton => Intl.message('Confirm', name: 'confirmButton');
  String scheduleOf(of) =>
      Intl.message('Schedule of $of', name: 'scheduleOf', args: [of]);
  String get emptyLessons =>
      Intl.message('There are no classes today, you can relax',
          name: 'emptyLessons');
  String get clearCache => Intl.message('Clear Cache', name: 'clearCache');
  String get changeGroup => Intl.message('Change Group', name: 'changeGroup');
  String get theme => Intl.message('Theme', name: 'theme');
  String get system => Intl.message('System', name: 'system');
  String get light => Intl.message('Light', name: 'light');
  String get dark => Intl.message('Dark', name: 'dark');
  String get teachers => Intl.message('Teachers', name: 'teachers');
  String get noTeachers =>
      Intl.message('There is no list of teachers', name: 'noTeachers');
  String get scientificWorks =>
      Intl.message('Scientific Works & Publications', name: 'scientificWorks');
  String get grades => Intl.message('Academic Performance', name: 'grades');
  String get addWork => Intl.message('Add Work', name: 'addWork');
  String get addPublication =>
      Intl.message('Add Publication', name: 'addPublication');
  String get addDiscipline =>
      Intl.message('Add Discipline', name: 'addDiscipline');
  String get workTitle => Intl.message('Title', name: 'workTitle');
  String get workType => Intl.message('Type', name: 'workType');
  String get workDate => Intl.message('Date', name: 'workDate');
  String get workDescription =>
      Intl.message('Description', name: 'workDescription');
  String get discipline => Intl.message('Discipline', name: 'discipline');
  String get note => Intl.message('Note', name: 'note');
  String get semester => Intl.message('Semester', name: 'semester');
  String get coursesNumber =>
      Intl.message('Courses Number', name: 'coursesNumber');
  String get additionalNote =>
      Intl.message('Additional Note', name: 'additionalNote');
  String get averageGrade =>
      Intl.message('Average Grade', name: 'averageGrade');
  String get noWorksYet =>
      Intl.message('No scientific works yet', name: 'noWorksYet');
  String get noGradesYet => Intl.message('No grades yet', name: 'noGradesYet');
  String get deleteWork =>
      Intl.message('Delete this work?', name: 'deleteWork');
  String get deleteDiscipline =>
      Intl.message('Delete this discipline?', name: 'deleteDiscipline');
  String get article => Intl.message('Article', name: 'article');
  String get conference => Intl.message('Conference', name: 'conference');
  String get monograph => Intl.message('Monograph', name: 'monograph');
  String get other => Intl.message('Other', name: 'other');
  String get grade => Intl.message('Grade', name: 'grade');
  String get gradeScale => Intl.message('Grade (1-10)', name: 'gradeScale');
  String get createdWork => Intl.message('Work created', name: 'createdWork');
  String get createdDiscipline =>
      Intl.message('Discipline added', name: 'createdDiscipline');
  String get workDeleted => Intl.message('Work deleted', name: 'workDeleted');
  String get disciplineDeleted =>
      Intl.message('Discipline deleted', name: 'disciplineDeleted');
  String get emptyWorkTitle =>
      Intl.message('Title cannot be empty', name: 'emptyWorkTitle');
  String get emptyDisciplineName =>
      Intl.message('Discipline name cannot be empty',
          name: 'emptyDisciplineName');
  String get emptyGrade =>
      Intl.message('Grade cannot be empty', name: 'emptyGrade');
  String get invalidGrade =>
      Intl.message('Grade must be between 1 and 10', name: 'invalidGrade');
  String get hometasks => Intl.message('Hometasks', name: 'hometasks');
  String get toComplete => Intl.message('To Complete', name: 'toComplete');
  String get completed => Intl.message('Completed', name: 'completed');
  String get today => Intl.message('Today', name: 'today');
  String get thereIsNotCompTask =>
      Intl.message('No completed tasks', name: 'thereIsNotCompTask');
  String get thereIsNotTask =>
      Intl.message('No tasks yet', name: 'thereIsNotTask');
  String get addNewTask => Intl.message('Add New Task', name: 'addNewTask');
  String get taskTitle => Intl.message('Task Title', name: 'taskTitle');
  String get notes => Intl.message('Notes', name: 'notes');
  String get createdTask => Intl.message('Task created', name: 'createdTask');
  String get emptyTitle =>
      Intl.message('Title cannot be empty', name: 'emptyTitle');
  String get taskDeleted => Intl.message('Task deleted', name: 'taskDeleted');
  String get taskDeleteAlert =>
      Intl.message('Delete this task?', name: 'taskDeleteAlert');
  String get taskIncompl =>
      Intl.message('Task marked as incomplete', name: 'taskIncompl');
  String get taskCompleted =>
      Intl.message('Task completed', name: 'taskCompleted');
  String get menu => Intl.message('Menu', name: 'menu');
  String get teachersAndClasses =>
      Intl.message('Teachers and Classes', name: 'teachersAndClasses');
  String get canteen => Intl.message('Canteen', name: 'canteen');
  String get services => Intl.message('Services', name: 'services');
  String get aboutApp => Intl.message('About App', name: 'aboutApp');
  String get numOfGroup => Intl.message('Group Number', name: 'numOfGroup');
  String get totalGroups => Intl.message('Total Groups', name: 'totalGroups');
  String get chooseExcel =>
      Intl.message('Select the Excel file', name: 'chooseExcel');
  String get ok => Intl.message('Ok', name: 'ok');
  String get cancel => Intl.message('Cancel', name: 'cancel');
  String get yes => Intl.message('Yes', name: 'yes');
  String get no => Intl.message('No', name: 'no');
  String get step => Intl.message('Step', name: 'step');
  String get step1 => Intl.message(
      'Download the ready-made schedule from our telegram channel!',
      name: 'step1');
  String get step2 => Intl.message(
      'Choose your group number and the number of groups on your stream.',
      name: 'step2');
  String get step3 => Intl.message(
      'Click on Select the Excel file and click on the schedule you downloaded.',
      name: 'step3');
  String get step4 =>
      Intl.message('Click Ok and enjoy our app!', name: 'step4');
  String get pass => Intl.message('Pass', name: 'pass');
  String get cacheDeleted =>
      Intl.message('Cache has been deleted', name: 'cacheDeleted');
  String get language => Intl.message('Language', name: 'language');
  String get languageChanged =>
      Intl.message('Language was changed. Restart the app please',
          name: 'languageChanged');
  String get main => Intl.message('Important', name: 'main');
  String get website => Intl.message('Website', name: 'website');
  String get websiteDesc =>
      Intl.message('Find the info you need', name: 'websiteDesc');
  String get moodleDesc =>
      Intl.message('Find out your assignments', name: 'moodleDesc');
  String get ilexDesc =>
      Intl.message('Be aware of the new laws', name: 'ilexDesc');
  String get communities => Intl.message('Communities', name: 'communities');
  String get aupprbChannel =>
      Intl.message('AUPPRB Schedule', name: 'aupprbChannel');
  String get aupprbChannelDesc =>
      Intl.message('Telegram channel with ready-made Excel files',
          name: 'aupprbChannelDesc');
  String get studSovet =>
      Intl.message('AUPPRB Student Council', name: 'studSovet');
  String get studSovetDesc =>
      Intl.message('An official group of the AUPPRB Student Council',
          name: 'studSovetDesc');
  String get profsouz =>
      Intl.message("AUPPRB Students' Union", name: 'profsouz');
  String get profsouzDesc =>
      Intl.message('Primary trade union organization of students',
          name: 'profsouzDesc');
  String get brsm => Intl.message('BRSM AUPPRB', name: 'brsm');
  String get brsmDesc =>
      Intl.message('The primary organization of the BRSM', name: 'brsmDesc');
  String get aupprbChannelDes =>
      Intl.message('Telegram channel with ready-made Excel files',
          name: 'aupprbChannelDes');
  String get time => Intl.message('Time', name: 'time');
  String get date => Intl.message('Date', name: 'date');
  String get taskToBeCompletedOn =>
      Intl.message('Task to be completed on ', name: 'taskToBeCompletedOn');
  String get noAdditionalNote =>
      Intl.message('There is no additional note for this task',
          name: 'noAdditionalNote');
  String get emptyCanteen =>
      Intl.message('Canteen is closed today', name: 'emptyCanteen');
  String get tryAgain => Intl.message('Try again', name: 'tryAgain');
  String get checkConn =>
      Intl.message('There is no internet connection.', name: 'checkConn');
  String get developers => Intl.message('Developers', name: 'developers');
  String get add => Intl.message('Add', name: 'add');
  String get price => Intl.message('Price', name: 'price');
  String get cart => Intl.message('Cart', name: 'cart');
  String get quantity => Intl.message('Quantity', name: 'quantity');
  String get total => Intl.message('Total', name: 'total');
  String get studDiscount =>
      Intl.message('Student discount', name: 'studDiscount');
  String get studentDisc =>
      Intl.message('Student discount', name: 'studentDisc');
  String get close => Intl.message('Close', name: 'close');
  String get clear => Intl.message('Clear', name: 'clear');
  String get portion => Intl.message('Portion', name: 'portion');
  String get appVersion => Intl.message('App version', name: 'appVersion');
  String get buildNum => Intl.message('Build number', name: 'buildNum');
  String get messageAboutApp =>
      Intl.message('This application is completely free and Open Source.',
          name: 'messageAboutApp');
  String get developedBy =>
      Intl.message('This app was developed by', name: 'developedBy');
  String get vlad => Intl.message('Vladislav Ponomarenko', name: 'vlad');
  String get and => Intl.message(' and ', name: 'and');
  String get andron => Intl.message('Andrey Suslov', name: 'andron');
  String get group => Intl.message('Group', name: 'group');
  String get menuDoesntWork =>
      Intl.message('The canteen menu is no longer available',
          name: 'menuDoesntWork');
  String get headerChanged =>
      Intl.message('The canteen administration has changed.',
          name: 'headerChanged');
  String get lection => Intl.message('Type: Lection', name: 'lection');
  String get credit => Intl.message('Type: Credit', name: 'credit');
  String get curHour => Intl.message('Type: Curator hour', name: 'curHour');
  String get practLesson =>
      Intl.message('Type: Practice lesson', name: 'practLesson');
  String get appIcon =>
      Intl.message('For the app icon thanks to ', name: 'appIcon');
  String get tanya => Intl.message('Tatyana Golubeva', name: 'tanya');
  String get canteenMenu => Intl.message('Canteen menu', name: 'canteenMenu');
  String get noData => Intl.message('No data', name: 'noData');
  String get fullName => Intl.message('Full name', name: 'fullName');
  String get attestationForm =>
      Intl.message('Attestation form', name: 'attestationForm');
  String get welcome => Intl.message('Welcome!', name: 'welcome');
  String get checkSchedule =>
      Intl.message('Check the schedule!', name: 'checkSchedule');
  String get beInKnown =>
      Intl.message('Be always in known!', name: 'beInKnown');
  String get exploreToUse =>
      Intl.message('Explore how to use!', name: 'exploreToUse');
  String get errorTellDevs =>
      Intl.message('Error. Tell to developers', name: 'errorTellDevs');
  String get twoWeeks => Intl.message('Two weeks', name: 'twoWeeks');
  String get week => Intl.message('Week', name: 'week');
  String get errorText =>
      Intl.message('You need to select a file', name: 'errorText');
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'be'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
