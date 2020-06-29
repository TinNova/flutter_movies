import 'package:flutter/material.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/models/movies.dart';
import 'package:movies/network/json_repo.dart';
import 'package:movies/network/secret_repo.dart';
import 'package:movies/ui/views/base_viewmodel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class MainViewModel extends BaseViewModel {
  final JsonRepo _jsonRepo = locator<JsonRepo>();
  final SecretRepo _secretRepo = locator<SecretRepo>();

  String _apiKey;
  List<Results> _gridMovies;
  List<Results> _jumboMovies;

  //Getters
  List<Results> get gridMovies => _gridMovies;
  List<Results> get currentMovies => _jumboMovies;

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
    Movies movies = await _jsonRepo.getCurrentMovies(_apiKey);

    _jumboMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
    debugPrint('jumbo Network Request');
  }

  _getUpcomingMovies() async {
    Movies movies = await _jsonRepo.getUpcomingMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
  }

  _getPopularMovies() async {
    Movies movies = await _jsonRepo.getPopularMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();

    print(movies.results[1].title);
  }

  _getTopRatedMovies() async {
    Movies movies = await _jsonRepo.getTopRatedMovies(_apiKey);

    _gridMovies = movies.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
  }
}
