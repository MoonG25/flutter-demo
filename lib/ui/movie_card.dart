import 'package:flutter/material.dart';
import 'package:flutter_basic/model/movie.dart';

class MovieCard extends StatefulWidget {
  Movie _movie;

  MovieCard(this._movie);

  @override
  _MovieCardState createState() => _MovieCardState(_movie);
}

class _MovieCardState extends State<MovieCard> {
  Movie movie;

  _MovieCardState(this.movie);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 150.0,
      height: 200.0,
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w300' + movie.posterPath),
          fit: BoxFit.cover,
        ),
        color: Color.fromARGB(255, 238, 238, 238),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 8.0,
            top: 8.0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 171, 85, 85),
              ),
              child: Center(
                child: Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(color: Colors.white)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
