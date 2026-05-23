import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/models/scientific_work.dart';

class ScientificWorkState extends Equatable {
  final List<ScientificWork> works;

  const ScientificWorkState({
    required this.works,
  });
  const ScientificWorkState.initial({
    this.works = const [],
  });

  ScientificWorkState copyWith({
    List<ScientificWork>? works,
  }) {
    return ScientificWorkState(
      works: works ?? this.works,
    );
  }

  @override
  List<Object> get props => [works];
}
