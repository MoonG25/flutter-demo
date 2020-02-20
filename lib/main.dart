import 'package:flutter/material.dart';
import 'pages/page_cgv.dart';
import 'pages/page_main.dart';
import 'pages/page_reg.dart';

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
        '/reg': (context) => RegPage(),
        '/cgv': (context) => CGVPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
