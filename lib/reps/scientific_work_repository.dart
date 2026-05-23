import 'package:flutter_test_project/models/scientific_work.dart';

abstract class ScientificWorkRepository {
  Future<void> addWork(ScientificWork work);
  Future<void> updateWork(ScientificWork work);
  Future<void> deleteWork(ScientificWork work);
  Future<List<ScientificWork>> getAllWorks();
}
