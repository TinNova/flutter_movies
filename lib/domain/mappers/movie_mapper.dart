import 'package:movies/app/locator.dart';
import 'package:movies/data/models/mdb_actor.dart';
import 'package:movies/data/models/mdb_credits.dart';
import 'package:movies/data/models/mdb_crew.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_movie.dart';
import 'package:movies/data/models/mdb_review.dart';
import 'package:movies/data/models/mdb_trailer.dart';
import 'package:movies/domain/mappers/date_time_mapper.dart';
import 'package:movies/domain/models/actor.dart';

import '../../consts.dart';
import '../models/movie.dart';
import '../models/movie_detail.dart';

class MovieMapper {
  final _dateTimeMapper = locator<DateTimeMapper>();

  Movie mapMovie(MDBMovie element) {
    return Movie(
        id: element.id,
        title: element.title,
        posterPath: MOVIE_DATABASE_IMAGE_POSTER + element.posterPath,
        backdropPath: MOVIE_DATABASE_IMAGE_BACKDROP + element.backdropPath);
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
        posterPath: MOVIE_DB_BASE_IMAGE_POSTER_DETAIL + movieDetail.posterPath,
        backdropPath: movieDetail.backdropPath,
        genres: movieDetail.genres,
        trailers: trailers,
        actors: mapActors(credits.actors),
        directors: getDirectors(credits.crew),
        reviews: reviews,
        popularity: movieDetail.popularity,
        releaseDate:
            _dateTimeMapper.formatDate(movieDetail.releaseDate, YYYYMMDD_FORMAT, DDMMMYYYY_FORMAT),
        revenue: movieDetail.revenue,
        runtime: _dateTimeMapper.getTimeString(movieDetail.runtime),
        tagline: movieDetail.tagline,
        voteAverage: movieDetail.voteAverage,
        voteCount: movieDetail.voteCount);
  }

  String getDirectors(List<MDBCrew> crew) {
    return PREFIX_DIRECTOR +
        crew.where((e) => e.job == "Director").toList().map((e) => e.name).join(", ");
  }

  List<Actor> mapActors(List<MDBActor> actors) {
    return actors
        .map((e) => Actor(
            castId: e.castId,
            character: e.character,
            creditId: e.creditId,
            gender: e.gender,
            id: e.id,
            name: e.name,
            order: e.order,
            profilePath: MOVIE_DB_BASE_IMAGE_PROFILE + e.profilePath))
        .toList();
  }
}
