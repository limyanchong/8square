import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:course_repository/course_repository.dart';
import 'package:eight_square/models/models.dart';
import 'quiz.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final _quizRepository = QuizRepository();
  List<Question> questions;
  int questionLeft;
  
  @override
  QuizState get initialState => QuizLoading();

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is LoadQuiz) {
      yield* _mapLoadQuizToState();
    } else if (event is LoadQuestion) {
      yield* _mapLoadQuestionToState();
    } else if (event is AnswerQuestion) {
      yield* _mapAnswerQuestionToState();
    }
  }

  Stream<QuizState> _mapLoadQuizToState() async* {
    try {
      final questionEntities = await _quizRepository.loadQuestions();
      questions = questionEntities.map((q)=> Question.fromJson(q)).toList();
      questionLeft = questions.length;
      yield QuizLoaded(); // Not needed but keep for expandibility.
      add(LoadQuestion()); // Load the first question.
    } catch (_) {
      yield QuizNotLoaded();
    }
  }
  
  Stream<QuizState> _mapLoadQuestionToState() async* {
    // Need to offset array counter.
    yield QuestionLoaded(
      questions[questions.length - questionLeft],
      questions.length,
    );
    questionLeft--;
  }
  
  Stream<QuizState> _mapAnswerQuestionToState() async* {
    if (questionLeft > 0) {
      add(LoadQuestion());
    } else {
      yield QuizFinished();
    }
  }
}
