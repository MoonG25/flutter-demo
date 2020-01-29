import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Container(
        height: 1,
        margin: EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(),
      ),
    );
  }
}
