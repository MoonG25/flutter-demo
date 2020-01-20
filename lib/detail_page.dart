import 'package:flutter/material.dart';
import 'package:flutter_basic/model/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(movie.title),
    );
  }
}
