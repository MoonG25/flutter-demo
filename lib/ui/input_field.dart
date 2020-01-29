import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String _hintText;
  bool _isPassword;

  InputField(this._hintText, this._isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(left: 15, top: 14, right: 18),
      child: TextField(
        decoration: InputDecoration(
          hintText: _hintText,
          hintStyle: TextStyle(color: Colors.white70),
//          contentPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.only(bottom: 12),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        maxLines: 1,
        autocorrect: false,
        obscureText: _isPassword,
      ),
    );
  }
}
