import 'package:equatable/equatable.dart';
import 'package:course_repository/course_repository.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadQuiz extends QuizEvent {}

class LoadQuestion extends QuizEvent {}

class AnswerQuestion extends QuizEvent {}

//TODO: Implement AddQuiz event.
class AddQuiz extends QuizEvent {}

//TODO: Implement UpdateQuiz event.
class UpdataQuiz extends QuizEvent {}

//TODO: Implement DeleteQuiz event.
class DeleteQuiz extends QuizEvent {}

// Not sure what is this different than UpdateQuiz, should be UpdateMultiQuiz?
class QuizUpdated extends QuizEvent {}
