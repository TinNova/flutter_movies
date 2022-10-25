import 'package:movies/app/locator.dart';
import 'package:movies/data/models/spring_movie_detail.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/detail_interactor.dart';
import 'package:movies/domain/models/movie.dart';
import 'package:movies/domain/models/movie_detail.dart';
import 'package:movies/domain/database_repo.dart';

import '../base_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  final _secretRepo = locator<SecretRepo>();
  final _detailInteractor = locator<DetailInteractor>();
  final _databaseRepo = locator<DatabaseRepo>();

  // MovieDetail _detail = MovieDetail(
  //     genres: List.empty(),
  //     trailers: List.empty(),
  //     actors: List.empty(),
  //     reviews: List.empty());

  late SpringMovieDetail _detail = SpringMovieDetail(0, "", "", "", "", "", 0.0,
      "", 0.0, "", "", 0, 0, false, List.empty(), List.empty(), "");

  SpringMovieDetail get detail => _detail;

  onViewCreated(int movieId) async {
    _getDetail(movieId);
  }

  _getDetail(int movieId) async {
    _detail = await _detailInteractor.getDetail(movieId);
    notifyListeners();
  }

  int getIndexOfChildren(int numOfReviews) {
    if (numOfReviews >= 5) {
      return 5;
    } else {
      return numOfReviews;
    }
  }

  void onHeartIconClick(SpringMovieDetail movie) async {
    if (movie.isFavourite) {
      String result = await _detailInteractor.saveFavouriteMovie(0, movie.id);
      if (result == DELETED)
        _detail.isFavourite = false; else true;
    } else {
      String result = await _detailInteractor.saveFavouriteMovie(0, movie.id);
      if (result == SAVED)
        _detail.isFavourite = true; else false;
      _detail.isFavourite = true;
    }
    notifyListeners();
  }
}

const String DELETED = "deleted";
const String SAVED = "saved";
