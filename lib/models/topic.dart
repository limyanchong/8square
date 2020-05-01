import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String id;
  final int topicNumber;
  final String topicName;
  final int questionTotal;

  const Topic(
    this.id,
    this.topicNumber,
    this.topicName,
    this.questionTotal,
  );
  
  @override
  List<Object> get props => [id, topicNumber, topicName, questionTotal];

  @override
  String toString() {
    return '''Topic {
      id: $id,
      topicNumber: $topicNumber,
      topicName: $topicName,
      questionTotal: $questionTotal,
    }''';
  }

  Topic copyWith(
    String id,
    int topicNumber,
    String topicName,
    int questionTotal,
  ) {
    return Topic(
      id ?? this.id,
      topicNumber ?? this.topicNumber,
      topicName ?? this.topicName,
      questionTotal ?? this.questionTotal,
    );
  }
  
  Map<String, Object> toJson() {
    return {
      'id': id,
      'topic_number': topicNumber,
      'topic_name': topicName,
      'question_total': questionTotal,
    };
  }

  static Topic fromJson(Map<String, Object> json) {
    return Topic(
      json['id'] as String,
      json['topic_number'] as int,
      json['topic_name'] as String,
      json['question_total'] as int,
    );
  }
}
