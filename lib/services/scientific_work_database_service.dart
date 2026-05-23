import 'dart:async';
import 'package:flutter_test_project/models/scientific_work.dart';
import 'package:flutter_test_project/services/storage.dart';

class ScientificWorkDatasource {
  static final ScientificWorkDatasource _instance =
      ScientificWorkDatasource._();
  factory ScientificWorkDatasource() => _instance;
  ScientificWorkDatasource._();

  final Storage _storage = Storage();

  Future<int> addWork(ScientificWork work) async {
    final works = await _storage.loadScientificWorks();
    final newId = await _storage.nextWorkId();

    final map = Map<String, dynamic>.from(work.toJson());
    map['id'] = newId;
    final newWork = ScientificWork.fromJson(map);

    works.insert(0, newWork);
    await _storage.saveScientificWorks(works);
    return newId;
  }

  Future<List<ScientificWork>> getAllWorks() async {
    final works = await _storage.loadScientificWorks();
    works.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
    return works;
  }

  Future<int> updateWork(ScientificWork work) async {
    final works = await _storage.loadScientificWorks();
    final idx = works.indexWhere((w) => (w.id ?? -1) == work.id);
    if (idx == -1) return 0;
    works[idx] = work;
    await _storage.saveScientificWorks(works);
    return 1;
  }

  Future<int> deleteWork(ScientificWork work) async {
    final works = await _storage.loadScientificWorks();
    final before = works.length;
    works.removeWhere((w) => (w.id ?? -1) == work.id);
    final removed = before - works.length;
    if (removed > 0) await _storage.saveScientificWorks(works);
    return removed;
  }
}
