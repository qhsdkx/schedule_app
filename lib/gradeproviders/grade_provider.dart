import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/reps/grade_repository_provider.dart';
import 'package:flutter_test_project/gradeproviders/grade_notifier.dart';
import 'package:flutter_test_project/gradeproviders/grade_state.dart';

final gradesProvider = StateNotifierProvider<GradeNotifier, GradeState>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GradeNotifier(repository);
});
