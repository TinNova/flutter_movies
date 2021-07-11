class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<Genre>? genres;
  final List<Trailer>? trailers;
  final List<Cast>? casts;
  final List<Review>? reviews;
  final double popularity;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  MovieDetail(
      {this.id = 0,
      this.title = "",
      this.overview = "",
      this.posterPath = "",
      this.backdropPath = "",
      this.genres,
      this.trailers,
      this.casts,
      this.reviews,
      this.popularity = 0.0,
      this.releaseDate = "",
      this.revenue = 0,
      this.runtime = 0,
      this.tagline = "",
      this.voteAverage = 0.0,
      this.voteCount = 0});
}

class Genre {
  final int id;
  final String name;
  Genre({this.id = 0, this.name = ""});
}

class Trailer {
  String id = "";
  String key = "";
  String thumbnail = "";
  String trailerUrl = "";

  Trailer({required this.id, required this.key, required this.thumbnail, required this.trailerUrl});
}

class Cast {
  int castId = 0;
  String character = "";
  int id = 0;
  String name = "";
  int order = 0;
  String profilePath = "";

  Cast(
      {required this.castId,
      required this.character,
      required this.id,
      required this.name,
      required this.order,
      required this.profilePath});
}

class Review {
  String author = "";
  String content = "";
  String id = "";
  String url = "";

  Review({required this.author, required this.content, required this.id, required this.url});
}
