import 'package:json_annotation/json_annotation.dart';
import 'mdb_movie.dart';
part 'mdb_movies.g.dart';

@JsonSerializable(explicitToJson: true) //This means MDBMovies depends on a nested class
class MDBMovies {

  @JsonKey(name: 'results')
  final List<MDBMovie> movies;
  MDBMovies({required this.movies});

  //int _page = 0; Todo: add pagination in future
  //int _totalResults = 0;
  //int _totalPages = 0;

  factory MDBMovies.fromJson(Map<String, dynamic> json) => _$MDBMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MDBMoviesToJson(this);

}
