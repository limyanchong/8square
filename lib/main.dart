import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:authentication/authentication.dart';
import 'package:login/login.dart';

import 'views/splash_screen.dart';
import 'views/homepage.dart';
import 'views/lesson_page.dart';
import 'views/quiz_page.dart';
import 'views/loading_page.dart';
import 'views/quiz_finished_page.dart';
import 'blocs/blocs.dart';

ThemeData _buildAppTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme(
      primary: Colors.cyan[50],
      primaryVariant: Color(0xFFC8A415),
      secondary: Colors.cyan[700],
      secondaryVariant: Color(0xFFC67100),
      surface: Colors.white,
      background: Colors.transparent,
      error: Colors.redAccent[700],
      onPrimary: Colors.brown[900],
      onSecondary: Colors.brown[900],
      onSurface: Colors.brown[900],
      onBackground: Colors.brown[900],
//      onPrimary: Colors.brown[900],
//      onSecondary: Colors.brown[900],
//      onSurface: Colors.brown[900],
//      onBackground: Colors.brown[900],
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.notoSansTextTheme(),
  ).copyWith(
    primaryColorLight: Color(0xFFFFFF81),
    primaryColorDark: Color(0xFFC8A415),
  );
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  return runApp(App());
}

class App extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: UserRepository(),
            )..add(AppStarted());
          },
        ),
        BlocProvider<QuizBloc>(
          create: (context) {
            return QuizBloc();
          }
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _buildAppTheme(),
        title: '8Square - MA',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return LoginPage(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              return Homepage(name: state.displayName);
            }
            return SplashScreen(); // state is Uninitialized
          },
        ),
        routes: {
          '/lesson': (context) {
            return LessonPage();
          },
          '/quiz': (context) {
            return BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuestionLoaded) {
                  return QuizPage(state.question, state.questionTotal);
                }
                if (state is QuizFinished) {
                  return QuizFinishedPage();
                }
                return LoadingPage(); // state is QuizLoading or QuizLoaded
                // TODO: capture more ConnectionState status.
              },
            );
          },
        },
      ),
    );
  }
}
