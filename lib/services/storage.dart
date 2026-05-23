import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('settsNew68', jsonEncode(settings.toMap()));
  }

  Future<Settings?> readSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final settings = prefs.getString('settsNew68');
    if (settings != null && settings.isNotEmpty) {
      return Settings.fromMap(jsonDecode(settings));
    }
    return null;
  }

  Future<void> saveSchedule(String date, String jsonFromBloc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(date, jsonFromBloc);
  }

  Future<String> readSchedule(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final schedule = prefs.getString(date).toString();
    return schedule;
  }

  Future<void> clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final settings = prefs.getString('settsNew68');
    final language = prefs.getString('language');
    prefs.clear();
    prefs.setString('settsNew68', settings ?? '');
    prefs.setString('language', language ?? '');
  }

  Future<void> clearFullStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> saveTime(List<String> time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('time4', time);
  }

  Future<List<String>> readTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final time = prefs.getStringList('time4') ?? [];
    return time;
  }

  Future<void> saveClassesData(List<DataClasses> classes) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonList = classes.map((item) => item.toJson()).toList();
      await prefs.setString(DATA_KEY, jsonEncode(jsonList));
    } catch (e) {
      throw Exception('Не удалось сохранить данные в кэш');
    }
  }

  Future<List<DataClasses>> loadClassesData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(DATA_KEY);

      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }

      final decodedData = jsonDecode(jsonString) as List<dynamic>;
      return decodedData.map((item) {
        return DataClasses(
          item['shortName'] as String,
          item['fullName'] as String,
          item['attestationForm'] as String,
          item['teachers'] as String,
        );
      }).toList();
    } catch (e) {
      throw Exception('Не удалось загрузить данные из кэша');
    }
  }

  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
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
