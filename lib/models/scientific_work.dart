import 'package:equatable/equatable.dart';

class ScientificWork extends Equatable {
  final int? id;
  final String title;
  final String type;
  final String date;
  final String description;

  const ScientificWork({
    this.id,
    required this.title,
    required this.type,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'type': type,
      'date': date,
      'description': description,
    };
  }

  factory ScientificWork.fromJson(Map<String, dynamic> map) {
    return ScientificWork(
      id: map['id'] as int?,
      title: map['title'] as String,
      type: map['type'] as String,
      date: map['date'] as String,
      description: map['description'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, title, type, date, description];

  ScientificWork copyWith({
    int? id,
    String? title,
    String? type,
    String? date,
    String? description,
  }) {
    return ScientificWork(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }
}
