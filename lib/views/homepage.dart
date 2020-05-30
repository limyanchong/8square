import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/authentication.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:eight_square/blocs/blocs.dart';

class Homepage extends StatelessWidget {
  final String name;
  
  Homepage({@required this.name});
  
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Featured',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                    ),
                  ),
                  Spacer(),
                  Text(
                    'SEE ALL',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/lesson');
                      },
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4.0),
                              ),
                              child: Image.asset(
                                'assets/images/sejarah.jpg',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TAMADUN ASIA',
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                    ),
                                  ),
                                  Text(
                                    '10 Lessons',
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/lesson');
                      },
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4.0),
                              ),
                              child: Image.asset(
                                'assets/images/notes.jpg',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Music Theory',
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                    ),
                                  ),
                                  Text(
                                    '20 Lessons',
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/lesson');
                      },
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4.0),
                              ),
                              child: Image.asset(
                                'assets/images/economics.jpg',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'World Economics',
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                    ),
                                  ),
                                  Text(
                                    '12 Lessons',
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/lesson');
                      },
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4.0),
                              ),
                              child: Image.asset(
                                'assets/images/geometry.jpg',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trigonometry',
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                    ),
                                  ),
                                  Text(
                                    '8 Lessons',
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    size: 24,
                  ),
                  hintText: 'Search for courses and lessons.',
                  hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Recent Courses',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                    ),
                  ),
                  Spacer(),
                  Text(
                    'SEE ALL',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 240,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text('S', style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      title: Text(
                        'Tamadun Asia',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        'Last access: 12 August',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: CircularPercentIndicator(
                        radius: 48.0,
                        lineWidth: 5.0,
                        percent: 0.7,
                        center: Text('70%'),
                        progressColor: Colors.cyan[200],
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text('C', style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      title: Text(
                        'Organic Chemistry',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        'Last access: 9 August',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: CircularPercentIndicator(
                        radius: 48.0,
                        lineWidth: 5.0,
                        percent: 0.45,
                        center: Text('45%'),
                        progressColor: Colors.cyan[200],
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text('E', style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      title: Text(
                        'Microeconomics',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        'Last access: 7 August',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: CircularPercentIndicator(
                        radius: 48.0,
                        lineWidth: 5.0,
                        percent: 0.3,
                        center: Text('30%'),
                        progressColor: Colors.cyan[200],
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                    ),
                  ),
                  Spacer(),
                  Text(
                    'SEE ALL',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.timeline,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Economics',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.history,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Sejarah',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.polymer,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Chemistry',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.library_books,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Literature',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.face,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Moral',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.functions,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Text(
                          'Mathematics',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ))),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: 0,
          selectedItemColor: Colors.cyan[200],
          elevation: 8,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('Account'),
            ),
          ],
        ),
      ),
    ]);
  }
}
