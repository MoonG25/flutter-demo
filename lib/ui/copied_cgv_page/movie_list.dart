import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/copied_cgv_page/movie_card.dart';

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
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              primary: false,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, index) {
                return MovieCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
