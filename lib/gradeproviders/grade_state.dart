import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/models/grade.dart';

class GradeState extends Equatable {
  final List<GradeEntry> grades;

  const GradeState({
    required this.grades,
  });
  const GradeState.initial({
    this.grades = const [],
  });

  GradeState copyWith({
    List<GradeEntry>? grades,
  }) {
    return GradeState(
      grades: grades ?? this.grades,
    );
  }

  @override
  List<Object> get props => [grades];
}
