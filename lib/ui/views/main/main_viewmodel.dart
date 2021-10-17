import 'package:movies/app/locator.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/domain/main_interactor.dart';
import 'package:movies/ui/views/base_viewmodel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class MainViewModel extends BaseViewModel {
  final _movieInteractor = locator<MovieInteractor>();
  final _secretRepo = locator<SecretRepo>();

  late String _apiKey;
  List<Movie> _gridMovies = [];
  List<Movie> _jumboMovies = [];

  List<Movie> get gridMovies => _gridMovies;
  List<Movie> get currentMovies => _jumboMovies;

  onViewCreated() async {
    await _secretRepo.getApi()
        .then((value) => _initScreen(value.apiKey))
        .onError((error, stackTrace) => null);
  }

  _initScreen(String apiKey) {
    _apiKey = apiKey;
    _getPopularMovies(apiKey);
    _getJumboMovies(apiKey);
  }

  onUpcomingClicked() {
    _getUpcomingMovies();
  }

  onTopRatedClicked() {
    _getTopRatedMovies();
  }

  onPopularClicked() {
    _getPopularMovies(_apiKey);
  }

  _getJumboMovies(String apiKey) async {
    _jumboMovies = await _movieInteractor.getCurrentMovies(apiKey);
    notifyListeners();
  }

  _getUpcomingMovies() async {
    _gridMovies = await _movieInteractor.getUpcomingMovies(_apiKey);
    notifyListeners();
  }

  _getPopularMovies(String apiKey) async {
    _gridMovies = await _movieInteractor.getPopularMovies(apiKey);
    notifyListeners();
  }

  _getTopRatedMovies() async {
    _gridMovies = await _movieInteractor.getTopRatedMovies(_apiKey);
    notifyListeners();
  }
}
