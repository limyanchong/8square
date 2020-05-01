import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';
import 'package:sign_up/sign_up.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({@required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create an Account'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SignUpPage(userRepository: _userRepository);
            },
          ),
        );
      },
    );
  }
}
