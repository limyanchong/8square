import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionEntity extends Equatable {
  final String id;
  final int questionNumber;
  final String questionText;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  const QuestionEntity(
    this.id,
    this.questionNumber,
    this.questionText,
    this.correctAnswer,
    this.incorrectAnswers,
  );

  @override
  List<Object> get props
    => [id, questionNumber, questionText, correctAnswer, incorrectAnswers];

  @override
  String toString() {
    return '''QuestionEntity {
      id: $id
      questionNumber: $questionNumber,
      questionText: $questionText,
      correctAnswer: $correctAnswer,
      incorrectAnswers: $incorrectAnswers,
    }''';
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'question_number': questionNumber,
      'question_text': questionText,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }

  static QuestionEntity fromJson(Map<String, Object> json) {
    return QuestionEntity(
      json['id'] as String,
      json['question_number'] as int,
      json['question_text'] as String,
      json['correct_answer'] as String,
      json['incorrect_answers'] as List<String>,
    );
  }

  // fromSnapshot & toDocument are firestore specific
  static QuestionEntity fromSnapshot(DocumentSnapshot snap) {
    return QuestionEntity(
      snap.documentID,
      snap.data['question_number'],
      snap.data['question_text'],
      snap.data['correct_answer'],
      List<String>.from(snap.data['incorrect_answers']),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'question_number': questionNumber,
      'question_text': questionText,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers.toString(),
    };
  }
}
