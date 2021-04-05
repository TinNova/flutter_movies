import 'package:movies/app/locator.dart';
import 'package:movies/data/models/movies.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/movie.dart';
import '../consts.dart';

class MovieInteractor {
  final _jsonRepo = locator<JsonRepo>();

  Future<List<Movie>> getCurrentMovies(String apiKey) async {
    List<MDBMovie> movies = await _jsonRepo.getCurrentMovies(apiKey);
    return returnList(movies);
  }

  List<Movie> returnList(List<MDBMovie> movies) {
    List<Movie> edittedMovies = [];

    movies.forEach((element) {
      if (element.backdropPath != null) {
        edittedMovies.add(mapMovie(element));
      }
    });

    return edittedMovies;
  }

  Movie mapMovie(MDBMovie element) {
    return Movie(
        id: element.id,
        title: element.title,
        posterPath: element.posterPath,
        backdropPath: MOVIE_DATABASE_IMAGE_W780 + element.backdropPath);
  }
}
