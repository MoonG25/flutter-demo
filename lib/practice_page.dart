import 'package:flutter/material.dart';
import 'cupertino_page.dart';

class PracticePage extends StatefulWidget {
  final String appName;

  PracticePage(this.appName);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.appName),
        backgroundColor: const Color(0xff000000),
      ),
      body: Stack(
          children: <Widget>[
            Center(
                child: new Image.asset(
                  'assets/images/cinema_background.jpg',
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fill,
                  color: Color.fromRGBO(12, 34, 56, 0.5),
                  colorBlendMode: BlendMode.exclusion,
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Movie App", style: TextStyle(fontSize: 30, color: const Color(0xffefefef))),
                  OutlineButton(
                    child: Text('Start App'),
                    borderSide: BorderSide(
                      color: const Color(0xffffffff),
                      width: 1.5,
                    ),
                    highlightedBorderColor: const Color(0xffffffff),
                    textColor: const Color(0xffffffff),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CupertinoPage())
                      );
                    },
                  )
                ],
              ),
            ),
          ]
      ),

    );
  }
}
