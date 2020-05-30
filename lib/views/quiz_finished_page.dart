import 'package:flutter/material.dart';

class QuizFinishedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Quiz Finished')),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
          ],
        ),
      ),
    );
  }
}
