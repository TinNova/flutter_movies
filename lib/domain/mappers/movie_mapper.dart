import 'package:movies/data/models/movie_detail_model.dart';
import 'package:movies/data/models/movies.dart';

import '../../consts.dart';
import '../movie.dart';
import '../movie_detail.dart';

class MovieMapper {
  Movie mapMovie(MDBMovie element) {
    return Movie(
        id: element.id,
        title: element.title,
        posterPath: MOVIE_DATABASE_IMAGE_W185 + element.posterPath,
        backdropPath: MOVIE_DATABASE_IMAGE_W780 + element.backdropPath);
  }

  MovieDetail mapMovieDetail(MDBDetailModel element) {
    return MovieDetail(
        id: element.id,
        title: element.title,
        overview: element.overview,
        posterPath: element.posterPath,
        backdropPath: element.backdropPath,
        genres: mapGenre(element.genres),
        popularity: element.popularity,
        releaseDate: element.releaseDate,
        revenue: element.revenue,
        runtime: element.runtime,
        tagline: element.tagline,
        voteAverage: element.voteAverage,
        voteCount: element.voteCount);
  }

  List<Genres> mapGenre(List<MDBGenres> elements) {
    return elements.map((e) => Genres(id: e.id, name: e.name)).toList();
  }
}
