import 'package:flutter/material.dart';

class AdLine extends StatefulWidget {
  @override
  _AdLineState createState() => _AdLineState();
}

class _AdLineState extends State<AdLine> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      height: 52.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 171, 85, 85),
      ),
      child: Container(
        width: screenWidth,
        child: Center(
          child: Text('AD', style: TextStyle(color: Colors.white),),
        )
      ),
    );
  }
}
