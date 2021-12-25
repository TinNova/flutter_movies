import 'package:movies/app/locator.dart';
import 'package:movies/data/models/slq_movie.dart';
import 'package:movies/data/network/json_repo.dart';
import 'database_repo.dart';
import 'mappers/movie_mapper.dart';
import 'models/movie.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _databaseRepo = locator<DatabaseRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<List<Movie>> getMovies(String apiKey, String moviePath) async {
    late List<Movie> movies;
    late List<SqlMovie> sqlMovies;

    await Future.wait([
      _databaseRepo.getAllFavMovies().then((value) => sqlMovies = value),
      _jsonRepo
          .getMovies(apiKey, moviePath)
          .then((value) => value.where((element) =>
              element.posterPath.isNotEmpty || element.backdropPath.isNotEmpty))
          .then(
              (value) => value.map((e) => _movieMapper.mapMovie(e, sqlMovies)))
          .then((value) => value.toList())
          .then((value) => movies = value)
    ]);

    return movies;
  }
}
