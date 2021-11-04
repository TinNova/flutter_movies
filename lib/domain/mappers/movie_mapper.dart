import 'package:movies/data/models/mdb_actor.dart';
import 'package:movies/data/models/mdb_credits.dart';
import 'package:movies/data/models/mdb_crew.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_movie.dart';
import 'package:movies/data/models/mdb_review.dart';
import 'package:movies/data/models/mdb_trailer.dart';

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

  Trailer mapTrailer(MDBTrailer trailer) {
    return Trailer(
        id: trailer.id,
        key: trailer.key,
        thumbnail: YOUTUBE_THUMBNAIL_START_URL + trailer.key + YOUTUBE_THUMBNAIL_END_URL,
        trailerUrl: YOUTUBE_TRAILER_BASE_URL + trailer.key);
  }

  MovieDetail mapDetail(
      MDBCredits credits, List<MDBReview> reviews, List<Trailer> trailers, MDBDetail movieDetail) {
    return MovieDetail(
        id: movieDetail.id,
        title: movieDetail.title,
        overview: movieDetail.overview,
        posterPath: movieDetail.posterPath,
        backdropPath: movieDetail.backdropPath,
        // genres: mapGenre(movieDetail.genres),
        trailers: trailers,
        actors: credits.actors,
        directors: getDirectors(credits.crew),
        reviews: reviews,
        popularity: movieDetail.popularity,
        releaseDate: movieDetail.releaseDate,
        revenue: movieDetail.revenue,
        runtime: movieDetail.runtime,
        tagline: movieDetail.tagline,
        voteAverage: movieDetail.voteAverage,
        voteCount: movieDetail.voteCount);
  }

  String getDirectors(List<MDBCrew> crew) {
    return PREFIX_DIRECTOR +
        crew
            .where((e) => e.job == "Director")
            .toList()
            .map((e) => e.name)
            .join(", ");
  }

// List<Genre> mapGenre(List<MDBGenres> elements) {
//   return elements.map((e) => Genre(id: e.id, name: e.name)).toList();
// }
}
