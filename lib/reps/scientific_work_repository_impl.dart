import 'package:flutter_test_project/models/scientific_work.dart';
import 'package:flutter_test_project/services/scientific_work_database_service.dart';
import 'package:flutter_test_project/reps/scientific_work_repository.dart';

class ScientificWorkRepositoryImpl implements ScientificWorkRepository {
  final ScientificWorkDatasource _datasource;
  ScientificWorkRepositoryImpl(this._datasource);

  @override
  Future<void> addWork(ScientificWork work) async {
    try {
      await _datasource.addWork(work);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteWork(ScientificWork work) async {
    try {
      await _datasource.deleteWork(work);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<ScientificWork>> getAllWorks() async {
    try {
      return await _datasource.getAllWorks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateWork(ScientificWork work) async {
    try {
      await _datasource.updateWork(work);
    } catch (e) {
      throw '$e';
    }
  }
}
