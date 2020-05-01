import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:authentication/authentication.dart';

class AuthenticationBloc
  extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is SignedIn) {
      yield* _mapSignedInToState();
    } else if (event is SignedOut) {
      yield* _mapSignedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      final name = await _userRepository.getUser();
      yield Authenticated(name);
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapSignedOutToState() async* {
    yield Unauthenticated();
    print('user signed out');
    _userRepository.signOut(); // should i put before yield?
  }
}
