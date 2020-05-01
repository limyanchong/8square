import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String courseName;
  final int topicTotal;

  const Course(
    this.id,
    this.courseName,
    this.topicTotal,
  );
  
  @override
  List<Object> get props => [id, courseName, topicTotal];

  @override
  String toString() {
    return '''Course {
      id: $id,
      courseName: $courseName,
      topicTotal: $topicTotal,
    }''';
  }

  Course copyWith(
    String id,
    String courseName,
    int topicTotal,
  ) {
    return Course(
      id ?? this.id,
      courseName ?? this.courseName,
      topicTotal ?? this.topicTotal,
    );
  }
  
  Map<String, Object> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'topic_total': topicTotal,
    };
  }

  static Course fromJson(Map<String, Object> json) {
    return Course(
      json['id'] as String,
      json['course_name'] as String,
      json['topic_total'] as int,
    );
  }
}
