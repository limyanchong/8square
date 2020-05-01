import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:audioplayers/audio_cache.dart';

import 'package:eight_square/blocs/blocs.dart';
import 'choice.dart';

class ChoiceBloc extends Bloc<ChoiceEvent, ChoiceState> {
  final QuizBloc quizBloc;
  StreamSubscription quizSubscription;
  final audioPlayer = AudioCache();
  String correctAnswer;
  List<String> choices;
  int chosenChoiceIndex;

  ChoiceBloc(this.quizBloc) {
    quizSubscription = quizBloc.listen((state) {
      if (state is QuestionLoaded) {
        correctAnswer = state.question.correctAnswer;
        choices = state.question.randomizedChoices();
        add(GenerateChoice());
      }
    });
  }
  
  @override
  ChoiceState get initialState => ChoiceUninitialized();

  @override
  Stream<ChoiceState> mapEventToState(ChoiceEvent event) async* {
    if (event is SelectChoice) {
      yield* _mapSelectChoiceToState(event);
    } else if (event is CheckChoice) {
      yield* _mapCheckChoiceToState(event);
    } else if (event is GenerateChoice) {
      yield* _mapGenerateChoiceToState();
    }
  }
  
  Stream<ChoiceState> _mapSelectChoiceToState(SelectChoice event) async* {
    chosenChoiceIndex = event.chosenChoiceIndex;
    yield ChoiceSelected(
      correctAnswer,
      choices,
      chosenChoiceIndex,
    );
  }
  
  Stream<ChoiceState> _mapCheckChoiceToState(CheckChoice event) async* {
    if (choices[chosenChoiceIndex] == correctAnswer) {
      audioPlayer.play('correct.wav');
    } else {
      audioPlayer.play('wrong.wav');
    }
    yield ChoiceChecked(
      correctAnswer,
      choices,
      chosenChoiceIndex,
      choices[chosenChoiceIndex] == correctAnswer,
    );
  }
  
  Stream<ChoiceState> _mapGenerateChoiceToState() async* {
    yield ChoiceNotSelected(
      correctAnswer,
      choices,
    );
  }
  
  @override
  Future<void> close() {
    quizSubscription.cancel();
    return super.close();
  }
}
