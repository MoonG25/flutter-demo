import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/model/movie.dart';
import 'package:flutter_basic/ui/movie_card.dart';
import 'package:http/http.dart' as http;

List<Movie> parseMovies(String responseBody) {
  var results = json.decode(responseBody)['results'];
  List<Movie> movies = new List<Movie>();
  results.forEach((result) {
    movies.add(Movie.fromJson(result));
  });
  return movies;
//  final parsed = json.decode(responseBody).cast<String, dynamic>();
//  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}

Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client.get('https://api.themoviedb.org/3/movie/popular?api_key=10923b261ba94d897ac6b81148314a3f&language=en-US');
  return parseMovies(response.body);
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const Color _commonColor = Colors.amberAccent;

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
            delegate: SliverChildListDelegate([Container(
              child: FutureBuilder(
                future: fetchMovies(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new MovieCard(snapshot.data[0]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )]),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/test_image_1.jpg'),
                  fit: BoxFit.cover
                ),
                color: _commonColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: _commonColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Main Page'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Reg Page'),
              onTap: () {
                Navigator.pushNamed(context, '/reg');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Movie List Page'),
              onTap: () {
                Navigator.pushNamed(context, '/cupertino');
              },
            ),
          ],
        ),
      ),
    );
  }
}
