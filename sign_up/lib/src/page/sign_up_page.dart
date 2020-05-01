import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  final UserRepository _userRepository;

  SignUpPage({@required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(userRepository: _userRepository),
        child: SignUpForm(),
      ),
    );
  }
}
