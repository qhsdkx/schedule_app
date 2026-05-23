import 'dart:async';
import 'package:flutter_test_project/models/grade.dart';
import 'package:flutter_test_project/services/storage.dart';

class GradeDatasource {
  static final GradeDatasource _instance = GradeDatasource._();
  factory GradeDatasource() => _instance;
  GradeDatasource._();

  final Storage _storage = Storage();

  Future<int> addGrade(GradeEntry grade) async {
    final grades = await _storage.loadGrades();
    final newId = await _storage.nextGradeId();

    final map = Map<String, dynamic>.from(grade.toJson());
    map['id'] = newId;
    final newGrade = GradeEntry.fromJson(map);

    grades.insert(0, newGrade);
    await _storage.saveGrades(grades);
    return newId;
  }

  Future<List<GradeEntry>> getAllGrades() async {
    final grades = await _storage.loadGrades();
    grades.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
    return grades;
  }

  Future<int> updateGrade(GradeEntry grade) async {
    final grades = await _storage.loadGrades();
    final idx = grades.indexWhere((g) => (g.id ?? -1) == grade.id);
    if (idx == -1) return 0;
    grades[idx] = grade;
    await _storage.saveGrades(grades);
    return 1;
  }

  Future<int> deleteGrade(GradeEntry grade) async {
    final grades = await _storage.loadGrades();
    final before = grades.length;
    grades.removeWhere((g) => (g.id ?? -1) == grade.id);
    final removed = before - grades.length;
    if (removed > 0) await _storage.saveGrades(grades);
    return removed;
  }
}
