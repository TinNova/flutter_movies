import 'package:movies/app/locator.dart';
import 'package:movies/data/models/movies.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/movie.dart';
import '../consts.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();

  Future<List<Movie>> getCurrentMovies(String apiKey) async {
    return await _jsonRepo
        .getCurrentMovies(apiKey)
        .then((value) => value.where((element) => element.backdropPath != null))
        .then((value) => value.map((e) => mapMovie(e)))
        .then((value) => value.toList());
  }

  Movie mapMovie(MDBMovie element) {
    return Movie(
        id: element.id,
        title: element.title,
        posterPath: element.posterPath,
        backdropPath: MOVIE_DATABASE_IMAGE_W780 + element.backdropPath);
  }
}
