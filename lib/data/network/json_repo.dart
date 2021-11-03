import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movies/data/models/mdb_actor.dart';
import 'package:movies/data/models/mdb_actors.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_movie.dart';
import 'package:movies/data/models/mdb_movies.dart';
import 'package:movies/data/models/mdb_trailer.dart';
import 'package:movies/data/models/mdb_trailers.dart';
import 'package:movies/data/models/review_model.dart';

List<MDBMovie> parseMovies(String responseBody) =>
    MDBMovies.fromJson(json.decode(responseBody)).movies;

List<MDBActor> parseActors(String responseBody) =>
    MDBActors.fromJson(json.decode(responseBody)).actors;

MDBDetail parseDetail(String responseBody) => MDBDetail.fromJson(json.decode(responseBody));

List<MDBTrailer> parseTrailers(String responseBody) =>
    MDBTrailers.fromJson(json.decode(responseBody)).trailers;

class JsonRepo {
  Future<List<MDBMovie>> getMovies(String apiKey, String moviePath) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$moviePath?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return compute(parseMovies, response.body);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future<MDBDetail> getDetail(String apiKey, int movieId) async {
    http.Response response = await http.get(
        Uri.parse("https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      return compute(parseDetail, response.body);
    } else {
      throw Exception('Failed to load Detail');
    }
  }

  Future<List<MDBTrailer>> getTrailers(String apiKey, int movieId) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      return compute(parseTrailers, response.body);
    } else {
      throw Exception('Failed to load Trailers');
    }
  }

  Future<List<MDBActor>> getCasts(String apiKey, int movieId) async {
    http.Response response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return compute(parseActors, response.body);
    } else {
      throw Exception("Failed to load Cast");
    }
  }

  Future<List<MDBReview>> getReviews(String apiKey, int movieId) async {
    http.Response response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return MovieReviewModel.map(json.decode(response.body)).reviews;
    } else {
      throw Exception("Failed to load Reviews");
    }
  }
}
