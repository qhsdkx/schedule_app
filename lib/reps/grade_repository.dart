import 'package:flutter_test_project/models/grade.dart';

abstract class GradeRepository {
  Future<void> addGrade(GradeEntry grade);
  Future<void> updateGrade(GradeEntry grade);
  Future<void> deleteGrade(GradeEntry grade);
  Future<List<GradeEntry>> getAllGrades();
}
