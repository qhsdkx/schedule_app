import 'dart:convert';
import 'dart:ui' as ui;
import '../models/settings.dart';
import 'package:flutter_test_project/services/parser/parser.dart';
import 'package:flutter_test_project/models/homework.dart';
import 'package:flutter_test_project/models/scientific_work.dart';
import 'package:flutter_test_project/models/grade.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  static const String DATA_KEY = "DATA_CLASSES";
  static const String SETTINGS_KEY = 'settsNew68';
  static const String LANGUAGE_KEY = 'language';
  static const _supported = {'ru', 'be', 'en'};
  static const String TASKS_KEY = 'tasks_v1';
  static const String TASKS_SEQ_KEY = 'tasks_seq_v1';
  static const String SCIENTIFIC_WORKS_KEY = 'scientific_works_v1';
  static const String SCIENTIFIC_WORKS_SEQ_KEY = 'scientific_works_seq_v1';
  static const String GRADES_KEY = 'grades_v1';
  static const String GRADES_SEQ_KEY = 'grades_seq_v1';

  String get _deviceLang {
    final code =
        ui.PlatformDispatcher.instance.locale.languageCode.toLowerCase();
    return _supported.contains(code) ? code : 'en';
  }

  Future<void> saveSettings(Settings settings) async {
    localStorage.setItem(SETTINGS_KEY, jsonEncode(settings.toMap()));
  }

  Future<Settings?> readSettings() async {
    final settings = localStorage.getItem(SETTINGS_KEY);
    if (settings != null && settings.isNotEmpty) {
      return Settings.fromMap(jsonDecode(settings));
    }
    return null;
  }

  Future<void> saveSchedule(String date, String jsonFromBloc) async {
    localStorage.setItem('schedule:$date', jsonFromBloc);
  }

  Future<String> readSchedule(String date) async {
    final key = 'schedule:$date';
    final s = localStorage.getItem(key);
    return s ?? '';
  }

  Future<void> clearStorage() async {
    final settings = localStorage.getItem(SETTINGS_KEY);
    final language = localStorage.getItem(LANGUAGE_KEY);
    final tasks = localStorage.getItem(TASKS_KEY);
    final tasks_seq = localStorage.getItem(TASKS_SEQ_KEY);
    final works = localStorage.getItem(SCIENTIFIC_WORKS_KEY);
    final works_seq = localStorage.getItem(SCIENTIFIC_WORKS_SEQ_KEY);
    final grades = localStorage.getItem(GRADES_KEY);
    final grades_seq = localStorage.getItem(GRADES_SEQ_KEY);
    localStorage.clear();
    localStorage.setItem(SETTINGS_KEY, settings ?? '');
    localStorage.setItem(LANGUAGE_KEY, language ?? '');
    localStorage.setItem(TASKS_KEY, tasks ?? '');
    localStorage.setItem(TASKS_SEQ_KEY, tasks_seq ?? '');
    localStorage.setItem(SCIENTIFIC_WORKS_KEY, works ?? '');
    localStorage.setItem(SCIENTIFIC_WORKS_SEQ_KEY, works_seq ?? '');
    localStorage.setItem(GRADES_KEY, grades ?? '');
    localStorage.setItem(GRADES_SEQ_KEY, grades_seq ?? '');
  }

  Future<void> clearFullStorage() async {
    localStorage.clear();
  }

  Future<void> saveTime(List<String> time) async {
    localStorage.setItem('time4', jsonEncode(time));
  }

  Future<List<String>> readTime() async {
    final ti = localStorage.getItem('time4');
    if (ti == null || ti.isEmpty) return [];
    return (jsonDecode(ti) as List).map((e) => e.toString()).toList();
  }

  Future<void> saveClassesData(List<DataClasses> classes) async {
    final jsonList = classes.map((item) => item.toJson()).toList();
    final jsonStr = jsonEncode(jsonList);
    localStorage.setItem(DATA_KEY, jsonStr);
  }

  Future<List<DataClasses>> loadClassesData() async {
    final String? jsonString;
    jsonString = localStorage.getItem(DATA_KEY);
    if (jsonString == null || jsonString.isEmpty) return [];
    final decodedData = jsonDecode(jsonString) as List<dynamic>;
    return decodedData
        .map((item) => DataClasses(
              item['shortName'] as String,
              item['fullName'] as String,
              item['attestationForm'] as String,
              item['teachers'] as String,
            ))
        .toList();
  }

  Future<void> saveLanguage(String language) async {
    localStorage.setItem(LANGUAGE_KEY, language);
  }

  Future<String> loadLanguage() async {
    final v = localStorage.getItem(LANGUAGE_KEY);
    return (v == null || v.isEmpty) ? _deviceLang : v;
  }

  void localStorageSaveSchedule(List<Day> days, int group) {
    for (var day in days) {
      localStorage.setItem(day.date, jsonEncode(day.classes[group]));
    }
  }

  List<String> localStorageReadSchedule(String date) {
    final jsonString = localStorage.getItem(date) ?? '';
    final decodedData = jsonDecode(jsonString) as List<dynamic>;
    return decodedData.map((item) => item.toString()).toList();
  }

  void localStorageSaveTime(List<String> time) {
    localStorage.setItem('time4', jsonEncode(time));
  }

  List<String> localStorageReadTime() {
    final jsonString = localStorage.getItem('time4') ?? '';
    final decodedData = jsonDecode(jsonString) as List<dynamic>;
    return decodedData.map((item) => item.toString()).toList();
  }

  void localStorageSaveDataClasses(List<DataClasses> classes) {
    final jsonList = classes.map((item) => item.toJson()).toList();
    localStorage.setItem(DATA_KEY, jsonEncode(jsonList));
  }

  List<DataClasses> localStorageReadClasses() {
    final jsonString = localStorage.getItem(DATA_KEY) ?? '';
    final decodedData = jsonDecode(jsonString) as List<dynamic>;
    return decodedData
        .map((item) => DataClasses(
              item['shortName'] as String,
              item['fullName'] as String,
              item['attestationForm'] as String,
              item['teachers'] as String,
            ))
        .toList();
  }

  Future<List<Homework>> loadTasks() async {
    final s = localStorage.getItem(TASKS_KEY);

    if (s == null || s.trim().isEmpty) return <Homework>[];
    try {
      final list = (jsonDecode(s) as List)
          .map((e) => Homework.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return list;
    } catch (_) {
      return <Homework>[];
    }
  }

  Future<void> saveTasks(List<Homework> tasks) async {
    final jsonStr = jsonEncode(tasks.map((e) => e.toJson()).toList());
    localStorage.setItem(TASKS_KEY, jsonStr);
  }

  Future<int> nextTaskId() async {
    final String? raw = localStorage.getItem(TASKS_SEQ_KEY);
    if (raw == null || raw.isEmpty) {
      final tasks = await loadTasks();
      final maxId =
          tasks.fold<int>(0, (m, t) => (t.id ?? 0) > m ? (t.id ?? 0) : m);
      final next = maxId + 1;
      localStorage.setItem(TASKS_SEQ_KEY, (next + 1).toString());
      return next;
    } else {
      final cur = int.tryParse(raw) ?? 1;
      localStorage.setItem(TASKS_SEQ_KEY, (cur + 1).toString());
      return cur;
    }
  }

  Future<List<ScientificWork>> loadScientificWorks() async {
    final s = localStorage.getItem(SCIENTIFIC_WORKS_KEY);
    if (s == null || s.trim().isEmpty) return <ScientificWork>[];
    try {
      final list = (jsonDecode(s) as List)
          .map((e) =>
              ScientificWork.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return list;
    } catch (_) {
      return <ScientificWork>[];
    }
  }

  Future<void> saveScientificWorks(List<ScientificWork> works) async {
    final jsonStr = jsonEncode(works.map((e) => e.toJson()).toList());
    localStorage.setItem(SCIENTIFIC_WORKS_KEY, jsonStr);
  }

  Future<int> nextWorkId() async {
    final String? raw = localStorage.getItem(SCIENTIFIC_WORKS_SEQ_KEY);
    if (raw == null || raw.isEmpty) {
      final works = await loadScientificWorks();
      final maxId =
          works.fold<int>(0, (m, w) => (w.id ?? 0) > m ? (w.id ?? 0) : m);
      final next = maxId + 1;
      localStorage.setItem(SCIENTIFIC_WORKS_SEQ_KEY, (next + 1).toString());
      return next;
    } else {
      final cur = int.tryParse(raw) ?? 1;
      localStorage.setItem(SCIENTIFIC_WORKS_SEQ_KEY, (cur + 1).toString());
      return cur;
    }
  }

  Future<List<GradeEntry>> loadGrades() async {
    final s = localStorage.getItem(GRADES_KEY);
    if (s == null || s.trim().isEmpty) return <GradeEntry>[];
    try {
      final list = (jsonDecode(s) as List)
          .map((e) => GradeEntry.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return list;
    } catch (_) {
      return <GradeEntry>[];
    }
  }

  Future<void> saveGrades(List<GradeEntry> grades) async {
    final jsonStr = jsonEncode(grades.map((e) => e.toJson()).toList());
    localStorage.setItem(GRADES_KEY, jsonStr);
  }

  Future<int> nextGradeId() async {
    final String? raw = localStorage.getItem(GRADES_SEQ_KEY);
    if (raw == null || raw.isEmpty) {
      final grades = await loadGrades();
      final maxId =
          grades.fold<int>(0, (m, g) => (g.id ?? 0) > m ? (g.id ?? 0) : m);
      final next = maxId + 1;
      localStorage.setItem(GRADES_SEQ_KEY, (next + 1).toString());
      return next;
    } else {
      final cur = int.tryParse(raw) ?? 1;
      localStorage.setItem(GRADES_SEQ_KEY, (cur + 1).toString());
      return cur;
    }
  }
}
