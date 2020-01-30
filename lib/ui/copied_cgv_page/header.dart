import 'package:flutter/material.dart';

class CopiedCGVHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(),
            ),
          ),
          Positioned(
            left: 9,
            top: 13,
            right: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Text(
                      "LOGO",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "AppleGothic",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
