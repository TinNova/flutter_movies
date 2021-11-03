import 'package:movies/app/locator.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/mappers/movie_mapper.dart';
import 'movie_detail.dart';

class DetailInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<MovieDetail> getDetail(String apiKey, int movieId) async {
    final actors = await _jsonRepo
        .getActors(apiKey, movieId);

    final reviews = await _jsonRepo
        .getReviews(apiKey, movieId);

    final trailers = await _jsonRepo
        .getTrailers(apiKey, movieId)
        .then((value) => value.map((e) => _movieMapper.mapTrailer(e)))
        .then((value) => value.toList());

    final movieDetail = await _jsonRepo.getDetail(apiKey, movieId);

    return _movieMapper.mapDetail(
        actors,
        reviews,
        trailers,
        movieDetail);
  }
}
