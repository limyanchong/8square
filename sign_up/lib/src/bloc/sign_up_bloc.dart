import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';
import 'package:validators/validators.dart';
import 'package:sign_up/sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository _userRepository;

  SignUpBloc({
    @required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  SignUpState get initialState => SignUpState.empty();

  @override
  Stream<Transition<SignUpEvent, SignUpState>> transformEvents(
    Stream<SignUpEvent> events,
    TransitionFunction<SignUpEvent, SignUpState> transitionFn,
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
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is ChangeEmail) {
      yield* _mapChangeEmailToState(event.email);
    } else if (event is ChangePassword) {
      yield* _mapChangePasswordToState(event.password);
    } else if (event is SubmitForm) {
      yield* _mapSubmitFormToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<SignUpState> _mapChangeEmailToState(String email) async* {
    yield state.update(
      isValidEmail: Validators.validateEmail(email),
    );
  }

  Stream<SignUpState> _mapChangePasswordToState(String password) async* {
    yield state.update(
      isValidPassword: Validators.validatePassword(password),
    );
  }

  Stream<SignUpState> _mapSubmitFormToState({
    String email,
    String password,
  }) async* {
    yield SignUpState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
      );
      yield SignUpState.success();
    } catch (_) {
      yield SignUpState.failure(); // See API ref, handle diff errors.
    }
  }
}
