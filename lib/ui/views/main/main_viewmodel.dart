import 'package:movies/app/locator.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/domain/movie_interactor.dart';
import 'package:movies/ui/views/base_viewmodel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class MainViewModel extends BaseViewModel {
  final _movieInteractor = locator<MovieInteractor>();
  final _secretRepo = locator<SecretRepo>();

  String _apiKey;
  List<Movie> _gridMovies;
  List<Movie> _jumboMovies;

  //Getters
  List<Movie> get gridMovies => _gridMovies;

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
  }

  _getUpcomingMovies() async {
    _gridMovies = await _movieInteractor.getUpcomingMovies(_apiKey);
    notifyListeners();
  }

  _getPopularMovies() async {
    _gridMovies = await _movieInteractor.getPopularMovies(_apiKey);
    notifyListeners();
  }

  _getTopRatedMovies() async {
    _gridMovies = await _movieInteractor.getTopRatedMovies(_apiKey);
    notifyListeners();
  }
}
