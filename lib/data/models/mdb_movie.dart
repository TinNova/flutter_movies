import 'package:json_annotation/json_annotation.dart';

part 'mdb_movie.g.dart';

@JsonSerializable()
class MDBMovie {
  final bool adult;
  @JsonKey(name: "poster_path", defaultValue: "")
  final String posterPath;
  final String overview;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  final int id;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  final String title;
  @JsonKey(name: "backdrop_path", defaultValue: "")
  final String backdropPath;
  final double popularity;
  @JsonKey(name: "vote_count")
  final int voteCount;
  final bool video;

  MDBMovie(
      {required this.adult,
      required this.posterPath,
      required this.overview,
      required this.releaseDate,
      required this.genreIds,
      required this.id,
      required this.originalTitle,
      required this.originalLanguage,
      required this.title,
      required this.backdropPath,
      required this.popularity,
      required this.voteCount,
      required this.video});

  factory MDBMovie.fromJson(Map<String, dynamic> json) => _$MDBMovieFromJson(json);

  Map<String, dynamic> toJson() => _$MDBMovieToJson(this);
}
