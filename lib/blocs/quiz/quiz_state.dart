import 'package:equatable/equatable.dart';
import 'package:eight_square/models/models.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {}

class QuizNotLoaded extends QuizState {}

// TODO: Implement QuizFinished & QuizCancel

class QuestionLoaded extends QuizState {
  final Question question;
  final int questionTotal;

  const QuestionLoaded(this.question, this.questionTotal);
  
  @override
  List<Object> get props => [question, questionTotal];
  
  @override
  String toString() => '''QuestionLoaded {
    question: $question,
    questionTotal: $questionTotal,
    }''';

}

class QuizFinished extends QuizState {}
