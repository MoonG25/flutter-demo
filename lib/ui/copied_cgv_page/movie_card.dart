import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 200.0,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5.0,
            top: 5.0,
            child: Container(
              width: 38,
              height: 16,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 156, 148),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
