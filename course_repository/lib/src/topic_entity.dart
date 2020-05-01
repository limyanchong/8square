import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopicEntity extends Equatable {
  final String id;
  final int topicNumber;
  final String topicName;
  final int questionTotal;

  const TopicEntity(
    this.id,
    this.topicNumber,
    this.topicName,
    this.questionTotal,
  );

  @override
  List<Object> get props => [id, topicNumber, topicName, questionTotal];

  @override
  String toString() {
    return '''TopicEntity {
      id: $id,
      topicNumber: $topicNumber,
      topicName: $topicName,
      questionTotal: $questionTotal,
    }''';
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'topic_number': topicNumber,
      'topic_name': topicName,
      'question_total': questionTotal,
    };
  }

  static TopicEntity fromJson(Map<String, Object> json) {
    return TopicEntity(
      json['id'] as String,
      json['topic_number'] as int,
      json['topic_name'] as String,
      json['question_total'] as int,
    );
  }

  // fromSnapshot & toDocument are firestore specific
  static TopicEntity fromSnapshot(DocumentSnapshot snap) {
    return TopicEntity(
      snap.data['id'],
      snap.data['topic_number'],
      snap.data['topic_name'],
      snap.data['question_total'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'topic_number': topicNumber,
      'topic_name': topicName,
      'question_total': questionTotal,
    };
  }
}
