import 'package:flutter/material.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/models/movie_trailer.dart';
import 'package:movies/network/json_repo.dart';
import 'package:movies/network/secret_repo.dart';

import '../base_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  final JsonRepo _jsonRepo = locator<JsonRepo>();
  final SecretRepo _secretRepo = locator<SecretRepo>();

  String _apiKey;
  List<Trailer> _trailers;

  //Getters
  List<Trailer> get trailers => _trailers;

  onViewCreated() async {
    var secret = await _secretRepo.getApi();
    _apiKey = secret.apiKey;
    _getTrailers();
  }

  _getTrailers() async {
    MovieTrailer movieTrailer = await _jsonRepo.getTrailers(_apiKey, 420817);

    _trailers = movieTrailer.results;

    //Notify every widget that is displaying _movies that the values have changed.
    notifyListeners();
    debugPrint('jumbo Network Request');
  }
}
