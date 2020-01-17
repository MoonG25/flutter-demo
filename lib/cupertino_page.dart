import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('CUPERTINO'),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text('CUPERTINO BUTTON'),
            pressedOpacity: 0.4,
            onPressed: () => print('hello'),
          ),
          CupertinoSwitch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          ),
          RaisedButton(
            child: Text('MATERIAL BUTTON'),
            onPressed: () => print('hello'),
          ),
          Switch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            }
          ),
          OutlineButton(
            child: Text('OUTLINE BUTTON'),
            onPressed: () => print('hello'),
          )
        ],
      )
    );
  }
}
