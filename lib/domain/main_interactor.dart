import 'package:movies/app/locator.dart';
import 'package:movies/data/network/json_repo.dart';
import 'mappers/movie_mapper.dart';
import 'models/movie.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<List<Movie>> getMovies(String apiKey, String moviePath) async {
    return await _jsonRepo
        .getMovies(apiKey, moviePath)
        .then((value) => value
            .where((element) => element.posterPath.isNotEmpty || element.backdropPath.isNotEmpty))
        .then((value) => value.map((e) => _movieMapper.mapMovie(e)))
        .then((value) => value.toList());
  }
}
