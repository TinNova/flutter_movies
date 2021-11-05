import 'package:movies/app/locator.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/detail_interactor.dart';
import 'package:movies/domain/movie_detail.dart';

import '../base_viewmodel.dart';

class DetailViewModel extends BaseViewModel {
  final _secretRepo = locator<SecretRepo>();
  final _detailInteractor = locator<DetailInteractor>();

  late String _apiKey;
  MovieDetail _detail = MovieDetail(trailers: List.empty(), actors: List.empty(), reviews: List.empty());

  MovieDetail get detail => _detail;

  onViewCreated() async {
    var secret = await _secretRepo.getApi();
    _apiKey = secret.apiKey;
    _getDetail();
  }

  _getDetail() async {
    _detail = await _detailInteractor.getDetail(_apiKey, 420817);
    notifyListeners();
  }
}
