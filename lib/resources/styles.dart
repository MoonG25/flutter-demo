import 'package:flutter/material.dart';

const colorMap = {
  'gold': Color(0xffcfb53b),
  'purple': Color(0xffba64aa),
};

const backgroundBg = Color(0xff344553);

List<BoxShadow> softUiShadow = [
  BoxShadow(
    color: Colors.black,
    offset: Offset(-5, -5),
    spreadRadius: 1,
    blurRadius: 15,
  ),
  BoxShadow(
    color: Color(0xff748cac).withOpacity(.6),
    offset: Offset(5, 5),
    spreadRadius: 1,
    blurRadius: 15,
  ),
];

const activeGradient = LinearGradient(
  colors: <Color>[
    Color(0xffad9319),
    Color(0xffdfc64c),
    Color(0xffefd72c),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);