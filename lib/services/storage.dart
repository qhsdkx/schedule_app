import 'dart:convert';
import 'dart:ui' as ui;
import '../models/settings.dart';
import 'package:flutter_test_project/services/parser/parser.dart';
import 'package:flutter_test_project/models/homework.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  static const String DATA_KEY = "DATA_CLASSES";
  static const String SETTINGS_KEY = 'settsNew68';
  static const String LANGUAGE_KEY = 'language';
  static const _supported = {'ru', 'be', 'en'};
  static const String TASKS_KEY = 'tasks_v1';
  static const String TASKS_SEQ_KEY = 'tasks_seq_v1';

  String get _deviceLang {
    final code =
        ui.PlatformDispatcher.instance.locale.languageCode.toLowerCase();
    return _supported.contains(code) ? code : 'en';
  }

  Future<void> saveSettings(Settings settings) async {
    final json = jsonEncode(settings.toMap());
    localStorage.setItem(SETTINGS_KEY, json);
  }

  Future<Settings?> readSettings() async {
    var settings = localStorage.getItem(SETTINGS_KEY);
    if (settings != null && settings.isNotEmpty)
      return Settings.fromMap(jsonDecode(settings));
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
    localStorage.clear();
    localStorage.setItem(SETTINGS_KEY, settings ?? '');
    localStorage.setItem(LANGUAGE_KEY, language ?? '');
    localStorage.setItem(TASKS_KEY, tasks ?? '');
    localStorage.setItem(TASKS_SEQ_KEY, tasks_seq ?? '');
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

  Future<void> _ensureTasksReady() async {
    localStorage.length != 0;
  }

  Future<List<Homework>> loadTasks() async {
    await _ensureTasksReady();
    final dynamic raw = localStorage.getItem(TASKS_KEY);
    if (raw == null) return [];

    final List<dynamic> decoded =
        raw is String ? (jsonDecode(raw) as List) : (raw as List);
    return decoded
        .map((e) => Homework.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<void> saveTasks(List<Homework> tasks) async {
    await _ensureTasksReady();
    final jsonStr = jsonEncode(tasks.map((e) => e.toJson()).toList());
    localStorage.setItem(TASKS_KEY, jsonStr);
  }

  Future<int> nextTaskId() async {
    await _ensureTasksReady();
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
}
