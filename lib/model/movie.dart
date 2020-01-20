class Movie {
  final dynamic id;
  final dynamic popularity;
  final dynamic voteCount;
  final dynamic video;
  final dynamic posterPath;
  final dynamic adult;
  final dynamic backdropPath;
  final dynamic originalLanguage;
  final dynamic originalTitle;
  final dynamic genreIds;
  final dynamic title;
  final dynamic voteAverage;
  final dynamic overview;
  final dynamic releaseDate;


  Movie({this.id, this.popularity, this.voteCount, this.video, this.posterPath,
      this.adult, this.backdropPath, this.originalLanguage, this.originalTitle,
      this.genreIds, this.title, this.voteAverage, this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'Movie{id: $id, popularity: $popularity, voteCount: $voteCount, video: $video, posterPath: $posterPath, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, genreIds: $genreIds, title: $title, voteAverage: $voteAverage, overview: $overview, releaseDate: $releaseDate}';
  }


}