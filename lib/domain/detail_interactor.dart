import 'package:movies/app/locator.dart';
import 'package:movies/data/models/mdb_credits.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_review.dart';
import 'package:movies/data/models/slq_movie.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/mappers/movie_mapper.dart';
import 'database_repo.dart';
import 'models/movie_detail.dart';

class DetailInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _databaseRepo = locator<DatabaseRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<MovieDetail> getDetail(String apiKey, int movieId) async {
    late List<SqlMovie> sqlMovies;
    late MDBDetail detail;
    late MDBCredits credits;
    late List<MDBReview> reviews;
    late List<Trailer> trailers;

    await Future.wait([
      _databaseRepo.getAllFavMovies().then((value) => sqlMovies = value),
      _jsonRepo.getDetail(apiKey, movieId).then((value) => detail = value),
      _jsonRepo.getCredits(apiKey, movieId).then((value) => credits = value),
      _jsonRepo.getReviews(apiKey, movieId).then((value) => reviews = value),
      _jsonRepo.getTrailers(apiKey, movieId)
          .then((value) => value.map((e) => _movieMapper.mapTrailer(e)))
          .then((value) => value.toList())
          .then((value) => trailers = value)
    ]);

    return _movieMapper.mapDetail(
        sqlMovies,
        credits,
        reviews,
        trailers,
        detail);
  }
}
