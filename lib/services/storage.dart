import 'dart:convert';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../integrations/telegram.dart';
import '../models/settings.dart';
import 'package:flutter_test_project/services/parser/parser.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  static const String DATA_KEY = "DATA_CLASSES";
  static const String SETTINGS_KEY = 'settsNew68';
  static const String LANGUAGE_KEY = 'language';
  static const _supported = {'ru', 'be', 'en'};

  bool get _useTg => kIsWeb && TelegramWebApp.isAvailable;

  String get _deviceLang {
    final code =
        ui.PlatformDispatcher.instance.locale.languageCode.toLowerCase();
    return _supported.contains(code) ? code : 'en';
  }

  Future<void> saveSettings(Settings settings) async {
    final json = jsonEncode(settings.toMap());
    if (_useTg) {
      localStorage.setItem(SETTINGS_KEY, json);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(SETTINGS_KEY, json);
    }
  }

  Future<Settings?> readSettings() async {
    if (_useTg) {
      var settings = localStorage.getItem(SETTINGS_KEY);
      if (settings != null && settings.isNotEmpty)
        return Settings.fromMap(jsonDecode(settings));
      return null;
    } else {
      final prefs = await SharedPreferences.getInstance();
      final s = prefs.getString(SETTINGS_KEY);
      if (s != null && s.isNotEmpty) return Settings.fromMap(jsonDecode(s));
      return null;
    }
  }

  Future<void> saveSchedule(String date, String jsonFromBloc) async {
    if (_useTg) {
      localStorage.setItem('schedule:$date', jsonFromBloc);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(date, jsonFromBloc);
    }
  }

  Future<String> readSchedule(String date) async {
    if (_useTg) {
      final key = 'schedule:$date';
      final s = localStorage.getItem(key);
      return s ?? '';
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(date) ?? '';
    }
  }

  Future<void> clearStorage() async {
    if (_useTg) {
      final settings = localStorage.getItem(SETTINGS_KEY);
      final language = localStorage.getItem(LANGUAGE_KEY);
      localStorage.clear();
      localStorage.setItem(SETTINGS_KEY, settings ?? '');
      localStorage.setItem(LANGUAGE_KEY, language ?? '');
    } else {
      final prefs = await SharedPreferences.getInstance();
      final settings = prefs.getString(SETTINGS_KEY);
      final language = prefs.getString(LANGUAGE_KEY);
      await prefs.clear();
      await prefs.setString(SETTINGS_KEY, settings ?? '');
      await prefs.setString(LANGUAGE_KEY, language ?? '');
    }
  }

  Future<void> clearFullStorage() async {
    if (_useTg) {
      localStorage.clear();
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }
  }

  Future<void> saveTime(List<String> time) async {
    if (_useTg) {
      localStorage.setItem('time4', jsonEncode(time));
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('time4', time);
    }
  }

  Future<List<String>> readTime() async {
    if (_useTg) {
      final ti = localStorage.getItem('time4');
      if (ti == null || ti.isEmpty) return [];
      return (jsonDecode(ti) as List).map((e) => e.toString()).toList();
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('time4') ?? [];
    }
  }

  Future<void> saveClassesData(List<DataClasses> classes) async {
    final jsonList = classes.map((item) => item.toJson()).toList();
    final jsonStr = jsonEncode(jsonList);
    if (_useTg) {
      localStorage.setItem(DATA_KEY, jsonStr);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(DATA_KEY, jsonStr);
    }
  }

  Future<List<DataClasses>> loadClassesData() async {
    final String? jsonString;
    if (_useTg) {
      jsonString = localStorage.getItem(DATA_KEY);
    } else {
      final prefs = await SharedPreferences.getInstance();
      jsonString = prefs.getString(DATA_KEY);
    }
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
    if (_useTg) {
      localStorage.setItem(LANGUAGE_KEY, language);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(LANGUAGE_KEY, language);
    }
  }

  Future<String> loadLanguage() async {
    if (_useTg) {
      final v = localStorage.getItem(LANGUAGE_KEY);
      return (v == null || v.isEmpty) ? _deviceLang : v;
    } else {
      final prefs = await SharedPreferences.getInstance();
      final v = prefs.getString(LANGUAGE_KEY);
      return (v == null || v.isEmpty) ? _deviceLang : v;
    }
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
}
