import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/input_field.dart';

import 'form_divider.dart';

class RegForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(left: 20, top: 70, right: 20),
      decoration: BoxDecoration(
        color: Colors.black26,
        boxShadow: [
        ],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputField("Your nickname", false),
          FormDivider(),
          InputField("Your spacemail", false),
          FormDivider(),
          InputField("Password (40+ characters)", true),
        ],
      ),
    );
  }
}
