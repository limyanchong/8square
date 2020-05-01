import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmail  extends LoginEvent {
  final String email;
  
  const ChangeEmail({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'ChangeEmail { email: $email }';
}

class ChangePassword extends LoginEvent {
  final String password;

  const ChangePassword({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'ChangePassword { password: $password }';
}

class SubmitForm extends LoginEvent {
  final String email;
  final String password;

  const SubmitForm({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'SubmitForm { email: $email, password: $password }';
}

class PressLoginWithGoogle extends LoginEvent {}

class PressLoginWithCredentials extends LoginEvent {
  final String email;
  final String password;

  const PressLoginWithCredentials({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'PressLoginWithCredentials { email: $email, password: $password }';
  }
}
