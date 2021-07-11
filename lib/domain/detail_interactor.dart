import 'package:movies/app/locator.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/domain/mappers/movie_mapper.dart';
import 'movie_detail.dart';

class DetailInteractor {
  final _jsonRepo = locator<JsonRepo>();
  final _movieMapper = locator<MovieMapper>();

  Future<MovieDetail> getDetail(String apiKey, int movieId) async {
    // final casts = await _jsonRepo
    //     .getCasts(apiKey, movieId)
    //     .then((value) => value.map((e) => _movieMapper.mapCast(e)))
    //     .then((value) => value.toList());

    // final reviews = await _jsonRepo
    //     .getReviews(apiKey, movieId)
    //     .then((value) => value.map((e) => _movieMapper.mapReview(e)))
    //     .then((value) => value.toList());
    //
    // final trailers = await _jsonRepo
    //     .getTrailers(apiKey, movieId)
    //     .then((value) => value.map((e) => _movieMapper.mapTrailer(e)))
    //     .then((value) => value.toList());

    final movieDetail = await _jsonRepo.getDetail(apiKey, movieId);

    // removing class for now as the castId in the json is a null and I don't know how to solve that
    return _movieMapper.mapDetail(
        //casts,
        // reviews,
        // trailers,
        movieDetail);
  }
}
