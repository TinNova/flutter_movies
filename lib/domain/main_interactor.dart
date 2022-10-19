import 'package:movies/app/locator.dart';
import 'package:movies/data/models/spring_movie.dart';
import 'package:movies/data/network/json_repo.dart';
import 'database_repo.dart';
import 'mappers/movie_mapper.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _databaseRepo = locator<DatabaseRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<List<SpringMovie>> getMovies(String moviePath) async {
    late List<SpringMovie> movies;
    // late List<SqlMovie> sqlMovies;

    return movies = await _jsonRepo
        .getMovies(moviePath)
        .then((value) => value
        .map((e) => _movieMapper
        .appendPosterPath(e))
        .toList());
    // return movies = (await Future.wait([
    // _databaseRepo.getAllFavMovies().then((value) => sqlMovies = value),
    // _jsonRepo
    //     .getMovies(moviePath)
    // .then((value) => value.where((element) =>
    //     element.posterPath.isNotEmpty || element.backdropPath.isNotEmpty))
    // .then(
    //     (value) => value.map((e) => _movieMapper.mapMovie(e, sqlMovies)))
    // .then((value) => value.toList())
    // .then((value) => movies = value)
    // ]));

    // return movies;
  }
}
