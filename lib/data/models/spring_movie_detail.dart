
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/data/models/spring_actor.dart';

part 'spring_movie_detail.g.dart';

@JsonSerializable(explicitToJson: true) //This means SpringMovieDetail depends on a nested class
class SpringMovieDetail {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'posterPath')
  final String posterPath;
  @JsonKey(name: 'backdropPath')
  final String backdropPath;
  @JsonKey(name: 'directors')
  final String directors;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'releaseDate')
  final String releaseDate;
  @JsonKey(name: 'revenue')
  final double revenue;
  @JsonKey(name: 'runtime')
  final String runtime;
  @JsonKey(name: 'tagline')
  final String tagline;
  @JsonKey(name: 'voteAverage')
  final double voteAverage;
  @JsonKey(name: 'voteCount')
  final int voteCount;
  @JsonKey(name: 'isFavourite')
  final bool isFavourite;
  @JsonKey(name: 'reviews')
  final List<String> reviews;
  @JsonKey(name: 'actors')
  final List<SpringActor> actors;
  @JsonKey(name: 'mdbId')
  final String mdbId;

  SpringMovieDetail(this.id, this.title, this.overview, this.posterPath, this.backdropPath, this.directors, this.popularity, this.releaseDate, this.revenue, this.runtime, this.tagline, this.voteAverage, this.voteCount, this.isFavourite, this.reviews, this.actors, this.mdbId);

  factory SpringMovieDetail.fromJson(Map<String, dynamic> json) =>
      _$SpringMovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SpringMovieDetailToJson(this);
}