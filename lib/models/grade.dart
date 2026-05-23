import 'package:equatable/equatable.dart';

class GradeEntry extends Equatable {
  final int? id;
  final String discipline;
  final int grade;
  final String note;
  final String semester;
  final String coursesNumber;
  final String additionalNote;

  const GradeEntry({
    this.id,
    required this.discipline,
    required this.grade,
    required this.note,
    required this.semester,
    required this.coursesNumber,
    required this.additionalNote,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'discipline': discipline,
      'grade': grade,
      'note': note,
      'semester': semester,
      'coursesNumber': coursesNumber,
      'additionalNote': additionalNote,
    };
  }

  factory GradeEntry.fromJson(Map<String, dynamic> map) {
    return GradeEntry(
      id: map['id'] as int?,
      discipline: map['discipline'] as String,
      grade: map['grade'] as int,
      note: map['note'] as String? ?? '',
      semester: map['semester'] as String? ?? '',
      coursesNumber: map['coursesNumber'] as String? ?? '',
      additionalNote: map['additionalNote'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props =>
      [id, discipline, grade, note, semester, coursesNumber, additionalNote];

  GradeEntry copyWith({
    int? id,
    String? discipline,
    int? grade,
    String? note,
    String? semester,
    String? coursesNumber,
    String? additionalNote,
  }) {
    return GradeEntry(
      id: id ?? this.id,
      discipline: discipline ?? this.discipline,
      grade: grade ?? this.grade,
      note: note ?? this.note,
      semester: semester ?? this.semester,
      coursesNumber: coursesNumber ?? this.coursesNumber,
      additionalNote: additionalNote ?? this.additionalNote,
    );
  }
}
