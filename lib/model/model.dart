class Movie {
  final int id;
  final int popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String title;
  final int voteAverage;
  final String overview;
  final String releaseDate;


  Movie({this.id, this.popularity, this.voteCount, this.video, this.posterPath,
      this.adult, this.backdropPath, this.originalLanguage, this.originalTitle,
      this.genreIds, this.title, this.voteAverage, this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    var results = json['results'];
    return Movie(
      id: results['id'],
      popularity: results['popularity'],
      voteCount: results['vote_count'],
      video: results['video'],
      posterPath: results['poster_path'],
      adult: results['adult'],
      backdropPath: results['backdrop_path'],
      originalLanguage: results['original_language'],
      originalTitle: results['original_title'],
      genreIds: results['genre_ids'],
      title: results['title'],
      voteAverage: results['vote_average'],
      overview: results['overview'],
      releaseDate: results['release_date']
    );
  }

}