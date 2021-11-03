import 'package:json_annotation/json_annotation.dart';

part 'mdb_detail.g.dart';

@JsonSerializable()
class MDBDetail {
  final int id;
  @JsonKey(name: 'imdb_id', defaultValue: "")
  final String imdbId;
  final bool adult;
  @JsonKey(name: 'backdrop_path', defaultValue: "")
  final String backdropPath;
  final int budget;
  // final List<MDBGenres> genres;
  @JsonKey(defaultValue: "")
  final String homepage;
  @JsonKey(name: 'original_language', defaultValue: "")
  final String originalLanguage;
  @JsonKey(name: 'original_title', defaultValue: "")
  final String originalTitle;
  @JsonKey(defaultValue: "")
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path', defaultValue: "")
  final String posterPath;
  // final List<MDBProductioncompanies> productionCompanies;
  // final List<MDBProductioncountries> productionCountries;
  @JsonKey(name: 'release_date', defaultValue: "")
  final String releaseDate;
  final int revenue;
  @JsonKey(defaultValue: -1)
  final int runtime;
  // final List<MDBSpokenlanguages> spokenLanguages;
  final String status;
  @JsonKey(name: 'tag_line', defaultValue: "")
  final String tagline;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  MDBDetail({
    required this.id,
    required this.imdbId,
    required this.adult,
    required this.backdropPath,
    required this.budget,
    // required this.genres,
    required this.homepage,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    // required this.productionCompanies,
    // required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    // required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });

  factory MDBDetail.fromJson(Map<String, dynamic> json) => _$MDBDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MDBDetailToJson(this);

}
