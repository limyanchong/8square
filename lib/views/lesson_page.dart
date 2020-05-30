import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/authentication.dart';

import 'package:eight_square/blocs/blocs.dart';

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height - data.padding.top;
    
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[100],
              Colors.grey[100],
            ],
          ),
        ),
      ),
      Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: screenHeight / 4,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Container(
                  color: Colors.grey[100],
                ),
                Positioned(
                  top: -200,
                  right: -200,
                  child: Container(
                    transform: Matrix4.rotationZ(0.5),
                    child: Icon(
                      Icons.all_inclusive,
                      size: 480,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              centerTitle: true,
              title: Text(
                'Tamadun Asia',
                style: Theme.of(context).textTheme.headline6
                  .copyWith(color: Colors.cyan[900]),
              ),
            ),
            floating: true,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                color: Colors.cyan[900],
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(SignedOut());
                },
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            sliver: SliverList(delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.cyan,
                  ),
                  Text(
                    ' Lim Yan Chong',
                    style: Theme.of(context).textTheme.bodyText1
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[800],
                      ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: Colors.amber[800],
                  ),
                  Text(
                    ' 5.0',
                    style: Theme.of(context).textTheme.bodyText1
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[900],
                      ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.deepOrange,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Introduction',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Introduce meanings of history.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.blueAccent,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.query_builder,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 1',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Test your understanding.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.green,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.public,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'World War 2 in Asia',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Conflicts between China and Japan.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.brown,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.question_answer,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 2',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Test your skill level.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.cyan,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.spa,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Southeast Asia Countries',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Learning the involvement of them in World War 2.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.purple,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 3',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Sharpen your understanding.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.deepOrange,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Introduction',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Introduce meanings of history.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.blueAccent,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.query_builder,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 1',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Test your understanding.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.green,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.public,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'World War 2 in Asia',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Conflicts between China and Japan.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.brown,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.question_answer,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 2',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Test your skill level.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.cyan,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.spa,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Southeast Asia Countries',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Learning the involvement of them in World War 2.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16.0,
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.purple,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    title: Text(
                      'Quiz 3',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      'Sharpen your understanding.',
                      style: Theme.of(context).textTheme.bodyText2
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                    ),
                    onTap: () {
                      BlocProvider.of<QuizBloc>(context).add(LoadQuiz());
                      Navigator.pushNamed(context, '/quiz');
                    }
                  ),
                ),
              ),
            ])),
          ),
        ]),
      ),
    ]);
  }
}
