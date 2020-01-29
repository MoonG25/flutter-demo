import 'package:flutter/material.dart';
import 'package:flutter_basic/model/movie.dart';

import '../detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool horizontal;

  MovieCard(this.movie, {this.horizontal = true});
  MovieCard.vertical(this.movie) : horizontal = false;

  TextStyle baseTextStyle() {
    return TextStyle(fontFamily: 'Poppins');
  }

  TextStyle headerTextStyle() {
    return baseTextStyle().copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle regularTextStyle() {
    return baseTextStyle().copyWith(
      color: Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle subHeaderTextStyle() {
    return regularTextStyle().copyWith(fontSize: 12.0);
  }

  @override
  Widget build(BuildContext context) {

    final movieThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: 'movie-${movie.id}',
        child: Image(
          image: NetworkImage('https://image.tmdb.org/t/p/w300' + movie.posterPath),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final movieCardContent = Container(
      margin: EdgeInsets.fromLTRB(
        horizontal ? 76.0 : 16.0,
        horizontal ? 16.0 : 42.0,
        16.0,
        16.0
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(movie.title, style: headerTextStyle()),
          Container(height: 10.0),
          Text(movie.releaseDate, style: subHeaderTextStyle()),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            width: 18.0,
            color: Color(0xff00c6ff)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: horizontal ? 1 : 0,
                child: Text(movie.adult ? 'adult' : 'not adult')
              ),
              Container(width: 32.0),
              Expanded(
                flex: horizontal ? 1 : 0,
                child: Text('장르'),
              ),
            ],
          )
        ],
      ),
    );

    final movieCard = Container(
      child: movieCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xff333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: horizontal ? () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailPage(movie),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        ),
      ) : null,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            movieCard,
            movieThumbnail,
          ],
        ),
      )
    );
  }
}
