import 'package:movies/app/locator.dart';
import 'package:movies/data/models/movie_trailer.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/detail_interactor.dart';
import 'package:movies/domain/movie_detail.dart';

import '../base_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  final _jsonRepo = locator<JsonRepo>();
  final _secretRepo = locator<SecretRepo>();
  final _detailInteractor = locator<DetailInteractor>();

  late String _apiKey;
  // late List<MDBTrailer> _trailers;
  MovieDetail _detail = MovieDetail();

  //Getters
  // List<MDBTrailer> get trailers => _trailers;
  MovieDetail get detail => _detail;
  String get title => _detail.title;

  onViewCreated() async {
    var secret = await _secretRepo.getApi();
    _apiKey = secret.apiKey;
    // _getTrailers();
    _getDetail();
  }

  // _getTrailers() async {
  //   List<MDBTrailer> trailers = await _jsonRepo.getTrailers(_apiKey, 420817);
  //   _trailers = trailers;
  //   notifyListeners();
  // }

  _getDetail() async {
    _detail = await _detailInteractor.getDetail(_apiKey, 420817);
    // _detail = movieDetail;
    // _title = _detail.title;
    notifyListeners();
  }
}
