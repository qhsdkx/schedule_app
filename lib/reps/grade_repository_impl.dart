import 'package:flutter_test_project/models/grade.dart';
import 'package:flutter_test_project/services/grade_database_service.dart';
import 'package:flutter_test_project/reps/grade_repository.dart';

class GradeRepositoryImpl implements GradeRepository {
  final GradeDatasource _datasource;
  GradeRepositoryImpl(this._datasource);

  @override
  Future<void> addGrade(GradeEntry grade) async {
    try {
      await _datasource.addGrade(grade);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteGrade(GradeEntry grade) async {
    try {
      await _datasource.deleteGrade(grade);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<GradeEntry>> getAllGrades() async {
    try {
      return await _datasource.getAllGrades();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateGrade(GradeEntry grade) async {
    try {
      await _datasource.updateGrade(grade);
    } catch (e) {
      throw '$e';
    }
  }
}
