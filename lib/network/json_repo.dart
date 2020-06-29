import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie_trailer.dart';
import 'package:movies/models/movies.dart';

class JsonRepo {
  Future<Movies> getCurrentMovies(String apiKey) async {
    http.Response response =
        await http.get('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load currentMovies');
    }
  }

  Future<Movies> getUpcomingMovies(String apiKey) async {
    http.Response response =
        await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load upcomingMovies');
    }
  }

  Future<Movies> getTopRatedMovies(String apiKey) async {
    http.Response response =
        await http.get('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load topRateMovies');
    }
  }

  Future<Movies> getPopularMovies(String apiKey) async {
    http.Response response =
        await http.get('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load popularMovies');
    }
  }

  Future<MovieTrailer> getTrailers(String apiKey, int movieId) async {
    http.Response response =
        await http.get("https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US");

    if (response.statusCode == 200) {
      // how to return the Trailer list directly?
      return MovieTrailer.map(json.decode(response.body));
    } else {
      throw Exception('Failed to load Trailers');
    }
  }
}
