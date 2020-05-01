import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:authentication/authentication.dart';
import 'package:sign_up/sign_up.dart';
import 'package:validators/validators.dart';

class SignUpForm extends StatefulWidget {
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpBloc _registrationBloc;

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignUpButtonEnabled(SignUpState state) {
    return state.isValidForm && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registrationBloc = BlocProvider.of<SignUpBloc>(context);
    _emailController.addListener(_onChangeEmail);
    _passwordController.addListener(_onChangePassword);
  }

  void _onChangeEmail() {
    _registrationBloc.add(
      ChangeEmail(email: _emailController.text),
    );
  }

  void _onChangePassword() {
    _registrationBloc.add(
      ChangePassword(password: _passwordController.text),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmitForm() {
    _registrationBloc.add(
      SubmitForm(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Signing Up...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sign Up Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(SignedIn());
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isValidEmail ? 'Invalid Email' : null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isValidPassword ? 'Invalid Password' : null;
                    },
                  ),
                  SignUpButton(
                    onPressed: isSignUpButtonEnabled(state)
                      ? _onSubmitForm
                      : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
