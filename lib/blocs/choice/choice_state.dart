import 'package:equatable/equatable.dart';

class ChoiceState extends Equatable {
  final String correctAnswer;
  final List<String> choices;
  
  const ChoiceState([this.correctAnswer, this.choices]);

  @override
  List<Object> get props => [this.correctAnswer, this.choices];

  @override
  String toString() => '''ChoiceState {
    correctAnswer: $correctAnswer,
    choices: $choices,
  }''';
}

class ChoiceUninitialized extends ChoiceState {
  const ChoiceUninitialized();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChoiceUninitialized {}';
}

class ChoiceNotSelected extends ChoiceState {
  const ChoiceNotSelected(String correctAnswer, List<String> choices)
    : super(correctAnswer, choices);

  @override
  List<Object> get props => [this.correctAnswer, this.choices];

  @override
  String toString() => '''ChoiceNotSelected {
    correctAnswer: $correctAnswer,
    choices: $choices,
  }''';
}

class ChoiceSelected extends ChoiceState {
  final int chosenChoiceIndex;

  const ChoiceSelected(
    String correctAnswer, List<String> choices, this.chosenChoiceIndex
  ) : super(correctAnswer, choices);

  @override
  List<Object> get props
    => [this.correctAnswer, this.choices, this.chosenChoiceIndex];

  @override
  String toString() => '''ChoiceSelected {
    correctAnswer: $correctAnswer,
    choices: $choices,
    chosenChoiceIndex: $chosenChoiceIndex,
  }''';
}

class ChoiceChecked extends ChoiceState {
  final int chosenChoiceIndex;
  final bool isCorrect;

  const ChoiceChecked(
    String correctAnswer,
    List<String> choices,
    this.chosenChoiceIndex,
    this.isCorrect,
  ) : super(correctAnswer, choices);

  @override
  List<Object> get props
  => [this.correctAnswer, this.choices, this.chosenChoiceIndex, this.isCorrect];

  @override
  String toString() => '''ChoiceChecked {
    correctAnswer: $correctAnswer,
    choices: $choices,
    chosenChoiceIndex: $chosenChoiceIndex,
    isCorrect: $isCorrect,
  }''';
}
