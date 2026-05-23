import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/models/scientific_work.dart';
import 'package:flutter_test_project/reps/scientific_work_repository.dart';
import 'package:flutter_test_project/scientificworkproviders/scientific_work_state.dart';

class ScientificWorkNotifier extends StateNotifier<ScientificWorkState> {
  final ScientificWorkRepository _repository;

  ScientificWorkNotifier(this._repository)
      : super(const ScientificWorkState.initial()) {
    getWorks();
  }

  Future<void> createWork(ScientificWork work) async {
    try {
      await _repository.addWork(work);
      getWorks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteWork(ScientificWork work) async {
    try {
      await _repository.deleteWork(work);
      getWorks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateWork(ScientificWork work) async {
    try {
      await _repository.updateWork(work);
      getWorks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getWorks() async {
    try {
      final works = await _repository.getAllWorks();
      state = state.copyWith(works: works);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
