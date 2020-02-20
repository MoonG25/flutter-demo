import 'package:flutter/material.dart';

import '../resources/styles.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBg,
      bottomNavigationBar: _buildBottomNavigationButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
              _topNavigationRow(),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRoundedIconButton(Icons.arrow_back),
        _buildRoundedIconButton(Icons.shopping_cart),
      ],
    );
  }

  Widget _buildRoundedIconButton(icon) {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        boxShadow: softUiShadow,
        color: Color(0xff405051),
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: colorMap['gold']
          // 0xffcfb53b
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24,
          color: Color(0xff353151).withOpacity(.7),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey.shade200,
            width: 1
          ),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '\$ 3,200',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.shade200
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: _preOrderButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _preOrderButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: activeGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorMap['gold'],
            spreadRadius: 6,
            blurRadius: 15,
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pre Order',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          VerticalDivider(
            color: Colors.yellowAccent,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 32,
          )
        ],
      ),
    );
  }
}
