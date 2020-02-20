import 'package:flutter/material.dart';
import 'package:flutter_basic/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie_card.dart';

List<Movie> parseMovies(String responseBody) {
  var results = json.decode(responseBody)['results'];
  List<Movie> movies = new List<Movie>();
  results.forEach((result) {
    movies.add(Movie.fromJson(result));
  });
  return movies;
}

Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client.get('https://api.themoviedb.org/3/movie/popular?api_key=10923b261ba94d897ac6b81148314a3f&language=en-US');
  return parseMovies(response.body);
}

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Text('박스오피스'),
                Text('전체순위'),
              ],
            ),
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    primary: false,
                    padding: EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      return MovieCard(snapshot.data[index]);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Row(
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Error ${snapshot.error}'),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ],
                );
              }
            },
            future: fetchMovies(http.Client()),
          ),
        ],
      ),
    );
  }
}
