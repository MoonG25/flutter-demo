import 'package:flutter/material.dart';
import 'package:flutter_basic/cupertino_page.dart';
import 'package:flutter_basic/main_page.dart';
import 'package:flutter_basic/practice_page.dart';
import 'package:flutter_basic/root_page.dart';

import 'reg_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/cupertino': (context) => CupertinoPage(),
        '/practice': (context) => PracticePage('practice'),
        '/reg': (context) => RegPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: RootPage()
    );
  }
}
