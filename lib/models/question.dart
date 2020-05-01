import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String id;
  final int questionNumber;
  final String questionText;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  
  const Question._internal(
    this.id,
    this.questionNumber,
    this.questionText,
    this.correctAnswer,
    this.incorrectAnswers,
  );
  
  factory Question.fromJson(Map<String, Object> json) {
    return Question._internal(
      json['id'] as String,
      json['question_number'] as int,
      json['question_text'] as String,
      json['correct_answer'] as String,
      json['incorrect_answers'] as List<String>,
    );
  }
  
  List<String> randomizedChoices() {
    return ([correctAnswer] + incorrectAnswers)
      ..shuffle();
  }

  @override
  List<Object> get props
    => [id, questionNumber, questionText, correctAnswer, incorrectAnswers];

  @override
  String toString() {
    return '''Question {
      id: $id,
      questionNumber: $questionNumber,
      questionText: $questionText,
      correctAnswer: $correctAnswer,
      incorrectAnswers: $incorrectAnswers,
    }''';
  }
  
  Question copyWith(
    String id,
    int questionNumber,
    String questionText,
    String correctAnswer,
    List<String> incorrectAnswers,
  ) {
    return Question._internal(
      id ?? this.id,
      questionNumber ?? this.questionNumber,
      questionText ?? this.questionText,
      correctAnswer ?? this.correctAnswer,
      incorrectAnswers?? this.incorrectAnswers,
    );
  }
  
  Map<String, Object> toJson() {
    return {
      'id': id,
      'question_number': questionNumber,
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      'incorrectAnswers': incorrectAnswers,
    };
  }
}
