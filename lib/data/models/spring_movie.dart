import 'package:json_annotation/json_annotation.dart';

part 'spring_movie.g.dart';

@JsonSerializable()
class SpringMovie {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'posterPath')
  final String posterPath;
  @JsonKey(name: 'backdropPath')
  final String backdropPath;
  @JsonKey(name: 'mdbId')
  final String mdbId;

  SpringMovie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.backdropPath,
      required this.mdbId});

  factory SpringMovie.fromJson(Map<String, dynamic> json) =>
      _$SpringMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SpringMovieToJson(this);
}
