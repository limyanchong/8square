import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback _onPressed;

  SignUpButton({VoidCallback onPressed})
    : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Sign Up'),
    );
  }
}
