class Movie {
  final int id;
  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List<dynamic> genreIds;
  final String title;
  final num voteAverage;
  final String overview;
  final String releaseDate;


  Movie({this.id, this.popularity, this.voteCount, this.video, this.posterPath,
      this.adult, this.backdropPath, this.originalLanguage, this.originalTitle,
      this.genreIds, this.title, this.voteAverage, this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    print(json);
    return Movie(
      id: json['id'],
      popularity: json['popularity'],
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'],
      title: json['title'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
      releaseDate: json['release_date']
    );
  }

}