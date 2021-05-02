import 'package:movies/app/locator.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/movie.dart';
import 'mappers/movie_mapper.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<List<Movie>> getCurrentMovies(String apiKey) async {
    return await _jsonRepo
        .getCurrentMovies(apiKey)
        .then((value) => value.where((element) => element.backdropPath != null))
        .then((value) => value.map((e) => _movieMapper.mapMovie(e)))
        .then((value) => value.toList());
  }

  Future<List<Movie>> getUpcomingMovies(String apiKey) async {
    return await _jsonRepo
        .getUpcomingMovies(apiKey)
        .then((value) => value.map((e) => _movieMapper.mapMovie(e)))
        .then((value) => value.toList());
  }

  Future<List<Movie>> getPopularMovies(String apiKey) async {
    return await _jsonRepo
        .getPopularMovies(apiKey)
        .then((value) => value.map((e) => _movieMapper.mapMovie(e)))
        .then((value) => value.toList());
  }

  Future<List<Movie>> getTopRatedMovies(String apiKey) async {
    return await _jsonRepo
        .getTopRatedMovies(apiKey)
        .then((value) => value.map((e) => _movieMapper.mapMovie(e)))
        .then((value) => value.toList());
  }
}
