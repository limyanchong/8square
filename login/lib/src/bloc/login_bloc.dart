import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';
import 'package:validators/validators.dart';
import 'package:login/login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! ChangeEmail && event is! ChangePassword);
    });

    final debounceStream = events.where((event) {
      return (event is ChangeEmail || event is ChangePassword);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }
  
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ChangeEmail) {
      yield* _mapChangeEmailToState(event.email);
    } else if (event is ChangePassword) {
      yield* _mapChangePasswordToState(event.password);
    } else if (event is PressLoginWithGoogle) {
      yield* _mapPressLoginWithGoogleToState();
    } else if (event is PressLoginWithCredentials) {
      yield* _mapPressLoginWithCredentialsToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapChangeEmailToState(String email) async* {
    yield state.update(
      isValidEmail: Validators.validateEmail(email),
    );
  }

  Stream<LoginState> _mapChangePasswordToState(String password) async* {
    yield state.update(
      isValidPassword: Validators.validatePassword(password),
    );
  }

  Stream<LoginState> _mapPressLoginWithGoogleToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapPressLoginWithCredentialsToState({
    String email,
    String password,
  }) async* {
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
