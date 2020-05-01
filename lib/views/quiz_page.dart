import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 
  'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'package:eight_square/models/models.dart';
import 'package:eight_square/blocs/blocs.dart';
import 'choice_buttons.dart';

class QuizPage extends StatelessWidget {
  final Question q; // q for question
  final int questionTotal;

  QuizPage(this.q, this.questionTotal);

  @override
  Widget build(BuildContext context) {
    Widget quizAppBar() {
      return PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.cyan[800],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Question ${q.questionNumber} of $questionTotal',
                style: Theme.of(context).textTheme.headline6
                  .copyWith(
                    color: Colors.cyan[800],
                  ),
              ),
            ],
          ),
        ),
      );
    }
    
    Widget quizProgressBar() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FAProgressBar(
          currentValue: (100 * (q.questionNumber - 1) ~/ questionTotal),
          size: 8,
          borderRadius: 8,
          progressColor: Colors.cyan,
          backgroundColor: Colors.cyan[50],
        ),
      );
    }
    
    Widget quizQuestion() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
        child: Text(
          q.questionText,
          style: Theme.of(context).textTheme.headline6
            .copyWith(
              color: Colors.cyan[900],
              height: 2,
            ),
          textAlign: TextAlign.center,
        ),
      );
    }
    
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
      Scaffold(
        body: BlocProvider(
          create: (context) => ChoiceBloc(BlocProvider.of<QuizBloc>(context)),
          child: Column(children: [
            quizAppBar(),
            Spacer(),
            quizQuestion(),
            Spacer(flex: 2),
            ChoiceButtons(),
            Spacer(),
            ProgressButton(),
          ]),
        ),
      ),
    ]);
//    return Scaffold(
//      body: Container(
//        width: double.infinity,
//        child: Stack(children: [
//          Column(
//            children: <Widget>[
//              //quizProgressBar(),
//              Expanded(
//                flex: 4,
//                child: ClipPath(
//                  clipper: QuestionClipping(),
//                  child: Container(
//                    decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter,
//                        colors: [
//                          Colors.lightBlue[600],
//                          Colors.lightBlue[800],
//                        ],
//                      ),
//                    ),
//                    child: Column(
//                      children: [
//                        quizAppBar(),
//                        Divider(
//                          indent: 50,
//                          endIndent: 50,
//                          color: Colors.white,
//                          height: 8,
//                        ),
//                        Flexible(
//                          child: FractionallySizedBox(
//                            heightFactor: 0.2,
//                          ),
//                        ),
//                        quizQuestion(),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 5,
//                child: quizChoices(),
//              ),
//            ],
//          ),
//          Positioned(
//            top: -200,
//            right: -200,
//            child: Container(
//              transform: Matrix4.rotationZ(0.5),
//              child: Icon(
//                Icons.all_inclusive,
//                size: 480,
//                color: Colors.white30,
//              ),
//            ),
//          ),
//        ]),
//      ),
//    );
  }
}

class QuestionClipping extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 45);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 45,
    );
//    path.lineTo(0.0, size.height - 45);
//    path.quadraticBezierTo(
//      size.width / 4, size.height - 90,
//      size.width / 2, size.height - 45
//    );
//    path.quadraticBezierTo(
//      size.width - size.width / 4, size.height,
//      size.width, size.height - 45
//    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ChoiceClipping extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 45);
    path.quadraticBezierTo(
      size.width / 2, 0,
      size.width, 45,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
