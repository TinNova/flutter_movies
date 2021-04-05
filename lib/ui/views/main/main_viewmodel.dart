import 'package:flutter/material.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/data/models/movies.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/domain/movie_interactor.dart';
import 'package:movies/ui/views/base_viewmodel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class MainViewModel extends BaseViewModel {
  final _jsonRepo = locator<JsonRepo>();
  final _movieInteractor = locator<MovieInteractor>();
  final _secretRepo = locator<SecretRepo>();

  String _apiKey;
  List<MDBMovie> _gridMovies;
  List<Movie> _jumboMovies;

  //Getters
  List<MDBMovie> get gridMovies => _gridMovies;

  List<Movie> get currentMovies => _jumboMovies;

  onViewCreated() async {
    var secret = await _secretRepo.getApi();
    _apiKey = secret.apiKey;
    _getPopularMovies();
    _getJumboMovies();
  }

  onUpcomingClicked() {
    _getUpcomingMovies();
  }

  onTopRatedClicked() {
    _getTopRatedMovies();
  }

  onPopularClicked() {
    _getPopularMovies();
  }

  _getJumboMovies() async {
    _jumboMovies = await _movieInteractor.getCurrentMovies(_apiKey);

    notifyListeners();
    debugPrint('jumbo Network Request');
  }

  _getUpcomingMovies() async {
    MDBMovies movies = await _jsonRepo.getUpcomingMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
  }

  _getPopularMovies() async {
    MDBMovies movies = await _jsonRepo.getPopularMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();

    print(movies.results[1].title);
  }

  _getTopRatedMovies() async {
    MDBMovies movies = await _jsonRepo.getTopRatedMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
  }
}
