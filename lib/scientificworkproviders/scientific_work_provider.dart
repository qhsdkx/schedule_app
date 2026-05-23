import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/reps/scientific_work_repository_provider.dart';
import 'package:flutter_test_project/scientificworkproviders/scientific_work_notifier.dart';
import 'package:flutter_test_project/scientificworkproviders/scientific_work_state.dart';

final scientificWorksProvider =
    StateNotifierProvider<ScientificWorkNotifier, ScientificWorkState>((ref) {
  final repository = ref.watch(scientificWorkRepositoryProvider);
  return ScientificWorkNotifier(repository);
});
