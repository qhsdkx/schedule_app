import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/models/grade.dart';
import 'package:flutter_test_project/reps/grade_repository.dart';
import 'package:flutter_test_project/gradeproviders/grade_state.dart';

class GradeNotifier extends StateNotifier<GradeState> {
  final GradeRepository _repository;

  GradeNotifier(this._repository) : super(const GradeState.initial()) {
    getGrades();
  }

  Future<void> createGrade(GradeEntry grade) async {
    try {
      await _repository.addGrade(grade);
      getGrades();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteGrade(GradeEntry grade) async {
    try {
      await _repository.deleteGrade(grade);
      getGrades();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateGrade(GradeEntry grade) async {
    try {
      await _repository.updateGrade(grade);
      getGrades();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getGrades() async {
    try {
      final grades = await _repository.getAllGrades();
      state = state.copyWith(grades: grades);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
