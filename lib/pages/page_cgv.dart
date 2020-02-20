import 'package:flutter/material.dart';

import 'package:flutter_basic/model/ad.dart';
import '../ui/ad_card.dart';
import '../ui/ad_line.dart';
import '../ui/movie_list.dart';

class CGVPage extends StatefulWidget {

  const CGVPage({ Key key }) : super(key: key);

  @override
  _CGVPageState createState() => _CGVPageState();
}

class _CGVPageState extends State<CGVPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'CGV',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w800
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.movie),
            color: Colors.black54,
            onPressed: () => print('movie'),
          ),
          IconButton(
            icon: Icon(Icons.video_library),
            color: Colors.black54,
            onPressed: () => print('video library'),
          ),
          IconButton(
            icon: Icon(Icons.movie_filter),
            color: Colors.black54,
            onPressed: () => print('movie filter'),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Color.fromARGB(255, 206, 140, 74),
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              tabs: <Widget>[
                Tab(text: '홈'),
                Tab(text: '이벤트'),
                Tab(text: '패스트오더'),
                Tab(text: '플레이존'),
                Tab(text: 'MY'),
              ],
            ),
            Container(
              height: screenHeight * 0.70,
              color: Color.fromARGB(255, 238, 238, 238),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        AdCard(new Ad(imageUrl: 'assets/images/test_image_1.jpg', subImageUrl: 'assets/images/test_image_1.jpg')),
                        AdLine(),
                        MovieList(),
                        AdLine(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Text('Event'),
                  ),
                  SingleChildScrollView(
                      child: Text('Fast order')
                  ),
                  SingleChildScrollView(
                    child: Text('Playzone'),
                  ),
                  SingleChildScrollView(
                    child: Text('My'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('hello'),
        tooltip: 'Add Alram',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
