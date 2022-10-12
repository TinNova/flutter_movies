import 'package:movies/data/models/mdb_genre.dart';
import 'package:movies/data/models/mdb_review.dart';

import 'actor.dart';

class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<MDBGenre> genres;
  final List<Trailer> trailers;
  final List<Actor> actors;
  final String directors;
  final List<MDBReview> reviews;
  final double popularity;
  final String releaseDate;
  final int revenue;
  final String runtime;
  final String tagline;
  final double voteAverage;
  final int voteCount;
  bool isFavourite;

  MovieDetail(
      {this.id = 0,
      this.title = "",
      this.overview = "",
      this.posterPath = "",
      this.backdropPath = "",
      required this.genres,
      required this.trailers,
      required this.actors,
      this.directors = "",
      required this.reviews,
      this.popularity = 0.0,
      this.releaseDate = "",
      this.revenue = 0,
      this.runtime = "",
      this.tagline = "",
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.isFavourite = false});
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
