import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/services/grade_database_service.dart';
import 'package:flutter_test_project/reps/grade_repository.dart';
import 'package:flutter_test_project/reps/grade_repository_impl.dart';

final gradeDatasourceProvider = Provider<GradeDatasource>((ref) {
  return GradeDatasource();
});

final gradeRepositoryProvider = Provider<GradeRepository>((ref) {
  final datasource = ref.read(gradeDatasourceProvider);
  return GradeRepositoryImpl(datasource);
});
