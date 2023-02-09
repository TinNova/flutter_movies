import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:movies/data/models/login_tokens.dart';
import 'package:movies/data/models/mdb_credits.dart';
import 'package:movies/data/models/mdb_review.dart';
import 'package:movies/data/models/mdb_reviews.dart';
import 'package:movies/data/models/mdb_trailer.dart';
import 'package:movies/data/models/mdb_trailers.dart';
import 'package:movies/data/models/spring_movie_saved.dart';
import 'package:movies/data/network/interceptor/spring_api_interceptor.dart';

import '../../app/locator.dart';
import '../models/spring_movie.dart';
import '../models/spring_movie_detail.dart';

class JsonRepo {
  final _api = locator<SpringApiInterceptor>();

  Map<String, String> body = {
    "username": "Goran",
    "password": "123",
  };

  Future<LoginTokens> login() async {
    Response response = await _api.dio.post("http://10.0.2.2:9000/api/login",
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ));
    if (response.statusCode == 200) {
      print(response.data);
      return LoginTokens.fromJson(response.data);
    } else {
      return _returnResponse(response.data);
    }
  }

  Future<LoginTokens> loginWithBody(Map<String, String> body) async {
    Response response = await _api.dio.post("http://10.0.2.2:9000/api/login",
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ));
    if (response.statusCode == 200) {
      print(response.data);
      var tokens = LoginTokens.fromJson(response.data);
      _api.saveTokens(tokens.accessToken, tokens.refreshToken);
      return tokens;
    } else {
      return _returnResponse(response.data);
    }
  }

  Future<List<SpringMovie>> getMovies(String moviePath) async {
    Response response = await _api.dio.get("http://10.0.2.2:9000/api/movies/");
    if (response.statusCode == 200) {
      final List responseBody = response.data;
      final List<SpringMovie> springMovies =
          responseBody.map((item) => SpringMovie.fromJson(item)).toList();
      return springMovies;
    } else {
      return _returnResponse(response.data);
    }
  }

  Future<SpringMovieDetail> getDetail(int movieId) async {
    Response response = await _api.dio.get(
      "http://10.0.2.2:9000/api/movies/$movieId/user/2", //TODO: How do we get the Users ID?
    );
    if (response.statusCode == 200) {
      return SpringMovieDetail.fromJson(response.data);
    } else {
      return _returnResponse(response);
    }
  }

  Future<String> saveFavouriteMovie(int userId, int movieId) async {
    Response response = await _api.dio.patch(
        "http://10.0.2.2:9000/api/users/2", //TODO: how to use actual userId?
        data: {"id": "$movieId"},
        );
    if (response.statusCode == 201) {
      return SpringMovieSaved.fromJson(response.data).saved;
    } else {
      return _returnResponse(response);
    }
  }

  Future<List<MDBTrailer>> getTrailers(String apiKey, int movieId) async {
    Response response = await _api.dio.get(
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US");

    if (response.statusCode == 200) {
      return MDBTrailers.fromJson(json.decode(response.data)).trailers;
    } else {
      return _returnResponse(response);
    }
  }

  Future<MDBCredits> getCredits(String apiKey, int movieId) async {
    Response response = await _api.dio.get(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey");

    if (response.statusCode == 200) {
      return MDBCredits.fromJson(json.decode(response.data));
    } else {
      return _returnResponse(response);
    }
  }

  Future<List<MDBReview>> getReviews(String apiKey, int movieId) async {
    Response response = await _api.dio.get(
        "https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$apiKey");

    if (response.statusCode == 200) {
      return MDBReviews.fromJson(json.decode(response.data)).reviews;
    } else {
      return _returnResponse(response);
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        throw Exception("400 Error: " + response.data);
      case 401:
      case 403:
        throw Exception("401 or 403 Error: " + response.data);
      case 500:
      default:
        throw Exception('500 Error: ${response.statusCode}');
    }
  }
}
