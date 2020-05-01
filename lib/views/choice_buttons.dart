import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eight_square/blocs/blocs.dart';

class ChoiceButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceBloc, ChoiceState>(
      builder: (context, state) {
        if (state is ChoiceUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        
        Color _choiceBorderColor(ChoiceState state, int index) {
          if (state is ChoiceSelected) {
            if (state.chosenChoiceIndex == index) {
              return Colors.cyan[400];
            }
          }
          
          if (state is ChoiceChecked) {
            if (state.choices[index] == state.correctAnswer) {
              return Colors.lightGreenAccent[400];
            } else if (state.chosenChoiceIndex == index) {
              return Colors.redAccent[400];
            }
          }
          return Colors.white;
        }
        
        Color _choiceButtonColor(ChoiceState state, int index) {
          if (state is ChoiceSelected) {
            if (state.chosenChoiceIndex == index) {
              return Colors.cyan[100];
            }
          }
          
          if (state is ChoiceChecked) {
            if (state.choices[index] == state.correctAnswer) {
              return Colors.lightGreenAccent[200];
            } else if (state.chosenChoiceIndex == index) {
              return Colors.redAccent[100];
            }
          }
          return Colors.white;
        }
        
        Widget _choiceButton(ChoiceState state, int index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(
                width: 8,
                color: _choiceBorderColor(state, index),
              )),
            ),
            child: FlatButton(
              color: _choiceButtonColor(state, index),
              highlightColor: Colors.transparent,
              onPressed: () {
                if (state is! ChoiceChecked) {
                  BlocProvider.of<ChoiceBloc>(context).add(SelectChoice(index));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                width: double.infinity,
                child: Text(
                  state.choices[index],
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1
                    .copyWith(color: Colors.cyan[900]),
                ),
              ),
            ),
          );
        }
        
        return Column(
          children: List<Widget>.generate(
            state.choices.length,
            (index) => _choiceButton(state, index),
          ),
        );
      },
    );
  }
}

class ProgressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceBloc, ChoiceState>(
      builder: (context, state) {
        if (state is ChoiceUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        
        List<Color> _progressButtonColors(ChoiceState state) {
          if (state is ChoiceSelected) {
            return [
              Colors.cyan[200],
              Colors.cyan[400],
            ];
          } else if (state is ChoiceChecked) {
            if (state.isCorrect) {
              return [
                Colors.lightGreenAccent[200],
                Colors.lightGreenAccent[400],
              ];
            } else {
              return [
                Colors.redAccent[200],
                Colors.redAccent[400],
              ];
            }
          }
          return [
            Colors.grey[300],
            Colors.grey[300],
          ];
        }
        
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _progressButtonColors(state),
            ),
          ),
          child: FlatButton(
            onPressed: () {
              if (state is ChoiceSelected) {
                BlocProvider.of<ChoiceBloc>(context).add(CheckChoice());
              } else if (state is ChoiceChecked) {
                BlocProvider.of<QuizBloc>(context).add(AnswerQuestion());
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 18,
                ),
              child: Text(
                (state is ChoiceChecked) ? 'Continue' : 'Check',
                style: Theme.of(context).textTheme.headline6
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
        );
      },
    );
  }
}
