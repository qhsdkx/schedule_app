import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/services/scientific_work_database_service.dart';
import 'package:flutter_test_project/reps/scientific_work_repository.dart';
import 'package:flutter_test_project/reps/scientific_work_repository_impl.dart';

final scientificWorkDatasourceProvider =
    Provider<ScientificWorkDatasource>((ref) {
  return ScientificWorkDatasource();
});

final scientificWorkRepositoryProvider =
    Provider<ScientificWorkRepository>((ref) {
  final datasource = ref.read(scientificWorkDatasourceProvider);
  return ScientificWorkRepositoryImpl(datasource);
});
