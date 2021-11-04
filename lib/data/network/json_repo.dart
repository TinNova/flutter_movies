import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movies/data/models/mdb_credits.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_movie.dart';
import 'package:movies/data/models/mdb_movies.dart';
import 'package:movies/data/models/mdb_review.dart';
import 'package:movies/data/models/mdb_reviews.dart';
import 'package:movies/data/models/mdb_trailer.dart';
import 'package:movies/data/models/mdb_trailers.dart';

List<MDBMovie> parseMovies(String responseBody) =>
    MDBMovies.fromJson(json.decode(responseBody)).movies;

List<MDBTrailer> parseTrailers(String responseBody) =>
    MDBTrailers.fromJson(json.decode(responseBody)).trailers;

List<MDBReview> parseReviews(String responseBody) =>
    MDBReviews.fromJson(json.decode(responseBody)).reviews;

MDBCredits parseCredits(String responseBody) => MDBCredits.fromJson(json.decode(responseBody));

MDBDetail parseDetail(String responseBody) => MDBDetail.fromJson(json.decode(responseBody));


class JsonRepo {
  Future<List<MDBMovie>> getMovies(String apiKey, String moviePath) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$moviePath?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return compute(parseMovies, response.body);
    } else {
      return _returnResponse(response);
    }
  }

  Future<MDBDetail> getDetail(String apiKey, int movieId) async {
    http.Response response = await http.get(
        Uri.parse("https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      return compute(parseDetail, response.body);
    } else {
      return _returnResponse(response);
    }
  }

  Future<List<MDBTrailer>> getTrailers(String apiKey, int movieId) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      return compute(parseTrailers, response.body);
    } else {
      return _returnResponse(response);
    }
  }

  Future<MDBCredits> getCredits(String apiKey, int movieId) async {
    http.Response response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return compute(parseCredits, response.body);
    } else {
      return _returnResponse(response);
    }
  }

  Future<List<MDBReview>> getReviews(String apiKey, int movieId) async {
    http.Response response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return compute(parseReviews, response.body);
    } else {
      return _returnResponse(response);
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw Exception("400 Error: " + response.body.toString());
      case 401:
      case 403:
        throw Exception("401 or 403 Error: " + response.body.toString());
      case 500:
      default:
        throw Exception(
            '500 Error: ${response.statusCode}');
    }
  }
}
