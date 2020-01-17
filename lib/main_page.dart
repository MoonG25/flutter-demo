import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/model.dart' as model;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const Color _commonColor = Colors.amberAccent;
  Future<List<model.Movie>> movie;

  @override
  void initState() {
    super.initState();
    movie = fetchMovies();
    print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: _commonColor,),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            centerTitle: true,
            title: const Text('DEMO', style: TextStyle(color: _commonColor)),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.access_alarm),
                onPressed: () {

                },
              )
            ],
            actionsIconTheme: IconThemeData(color: _commonColor, opacity: 0.8),
            backgroundColor: _commonColor,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: new Image.asset(
                'assets/ad_1.jpg',
                height: 200,
                fit: BoxFit.fill,
                color: Color.fromRGBO(34, 56, 78, 0.8),
                colorBlendMode: BlendMode.exclusion,
              ),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 150,
            ),
          ),
        ],
      )
    );
  }

  Future<List<model.Movie>> fetchMovies() async {
    final response = await http.get('https://api.themoviedb.org/3/movie/popular?api_key=10923b261ba94d897ac6b81148314a3f&language=en-US');

    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      List<model.Movie> movies = new List();
      List<dynamic> dm = res['results'];
      dm.forEach((e) {
        model.Movie mv = model.Movie.fromJson(e);
        movies.add(mv);
      });
      return movies;
    } else {
      throw Exception('failed to load post');
    }
  }
}
