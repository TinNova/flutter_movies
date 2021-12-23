import 'package:movies/app/locator.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/detail_interactor.dart';
import 'package:movies/domain/models/movie_detail.dart';

import '../base_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  final _secretRepo = locator<SecretRepo>();
  final _detailInteractor = locator<DetailInteractor>();

  late String _apiKey;
  MovieDetail _detail = MovieDetail(
      genres: List.empty(), trailers: List.empty(), actors: List.empty(), reviews: List.empty());

  MovieDetail get detail => _detail;

  onViewCreated(int movieId) async {
    var secret = await _secretRepo.getApi();
    _apiKey = secret.apiKey;
    _getDetail(movieId);
  }

  _getDetail(int movieId) async {
    _detail = await _detailInteractor.getDetail(_apiKey, movieId);
    notifyListeners();
  }

  int getIndexOfChildren(int numOfReviews) {
    if (numOfReviews >= 5) {
      return 5;
    } else {
      return numOfReviews;
    }
  }
}
