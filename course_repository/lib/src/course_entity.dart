import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseEntity extends Equatable {
  final String id;
  final String courseName;
  final int topicTotal;

  const CourseEntity(
    this.id,
    this.courseName,
    this.topicTotal,
  );

  @override
  List<Object> get props => [id, courseName, topicTotal];

  @override
  String toString() {
    return '''CourseEntity {
      id: $id,
      courseName: $courseName,
      topicTotal: $topicTotal,
    }''';
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'topic_total': topicTotal,
    };
  }

  static CourseEntity fromJson(Map<String, Object> json) {
    return CourseEntity(
      json['id'] as String,
      json['course_name'] as String,
      json['topic_total'] as int,
    );
  }

  // fromSnapshot & toDocument are firestore specific
  static CourseEntity fromSnapshot(DocumentSnapshot snap) {
    return CourseEntity(
      snap.data['id'],
      snap.data['course_name'],
      snap.data['topic_total'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'course_name': courseName,
      'topic_total': topicTotal,
    };
  }
}
