import 'package:equatable/equatable.dart';

abstract class ChoiceEvent extends Equatable {
  const ChoiceEvent();

  @override
  List<Object> get props => [];
}

class GenerateChoice extends ChoiceEvent {}

class SelectChoice extends ChoiceEvent {
  final int chosenChoiceIndex;

  const SelectChoice(this.chosenChoiceIndex);

  @override
  List<Object> get props => [chosenChoiceIndex];

  @override
  String toString() => 'SelectChoice { chosenChoiceIndex: $chosenChoiceIndex }';
}

class CheckChoice extends ChoiceEvent {
  const CheckChoice();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'CheckChoice {}';
}
