import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/data/models/cast_model.dart';
import 'package:movies/data/models/movie_detail_model.dart';
import 'package:movies/data/models/movie_trailer.dart';
import 'package:movies/data/models/movies.dart';
import 'package:movies/data/models/review_model.dart';

class JsonRepo {
  Future<List<MDBMovie>> getCurrentMovies(String apiKey) async {
    http.Response response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return MDBMovies.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load currentMovies');
    }
  }

  Future<List<MDBMovie>> getUpcomingMovies(String apiKey) async {
    http.Response response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return MDBMovies.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load upcomingMovies');
    }
  }

  Future<List<MDBMovie>> getTopRatedMovies(String apiKey) async {
    http.Response response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return MDBMovies.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load topRateMovies');
    }
  }

  Future<List<MDBMovie>> getPopularMovies(String apiKey) async {
    http.Response response =
        await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      return MDBMovies.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load popularMovies');
    }
  }

  Future<MDBDetailModel> getDetail(String apiKey, int movieId) async {
    http.Response response =
        await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      // String yourJson = '{"code": "0", "text": "hello world"}';
      //
      // final object = json.decode(yourJson);
      // final prettyString = JsonEncoder.withIndent('  ').convert(object);

      print("TINTIN: " + response.body);
      return MDBDetailModel.map(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail');
    }
  }

  Future<List<MDBTrailer>> getTrailers(String apiKey, int movieId) async {
    http.Response response =
        await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US"));

    if (response.statusCode == 200) {
      return MDBMovieTrailers.map(json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load Trailers');
    }
  }

  Future<List<MDBCast>> getCasts(String apiKey, int movieId) async {
    http.Response response =
        await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return MovieCast.map(json.decode(response.body)).cast;
    } else {
      throw Exception("Failed to load Cast");
    }
  }

  Future<List<MDBReview>> getReviews(String apiKey, int movieId) async {
    http.Response response =
        await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return MovieReviewModel.map(json.decode(response.body)).reviews;
    } else {
      throw Exception("Failed to load Reviews");
    }
  }
}
