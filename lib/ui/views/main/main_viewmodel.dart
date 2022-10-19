import 'package:movies/app/locator.dart';
import 'package:movies/consts.dart';
import 'package:movies/data/models/spring_movie.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/database_repo.dart';
import 'package:movies/domain/models/movie.dart';
import 'package:movies/domain/main_interactor.dart';
import 'package:movies/ui/views/base_viewmodel.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class MainViewModel extends BaseViewModel {
  final _movieInteractor = locator<MovieInteractor>();
  final _databaseRepo = locator<DatabaseRepo>();

  List<SpringMovie> _gridMovies = [];
  List<SpringMovie> _jumboMovies = [];

  List<SpringMovie> get gridMovies => _gridMovies;

  List<SpringMovie> get currentMovies => _jumboMovies;

  onViewCreated() async {
    _initScreen();
  }

  _initScreen() {
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
    _jumboMovies = await _movieInteractor.getMovies(NOW_PLAYING);
    notifyListeners();
  }

  _getUpcomingMovies() async {
    _gridMovies = await _movieInteractor.getMovies(UPCOMING);
    notifyListeners();
  }

  _getPopularMovies() async {
    _gridMovies = await _movieInteractor.getMovies(POPULAR);
    notifyListeners();
  }

  _getTopRatedMovies() async {
    _gridMovies = await _movieInteractor.getMovies(TOP_RATED);
    notifyListeners();
  }

  // onHeartIconClickGrid(Movie movie) {
  //   if (movie.isFavourite) {
  //     _databaseRepo.deleteFavMovie(movie.id);
  //     int index = _gridMovies.indexOf(movie);
  //     _gridMovies[index].isFavourite = false;
  //   } else {
  //     _databaseRepo.insertFavMovie(movie);
  //     int index = _gridMovies.indexOf(movie);
  //     _gridMovies[index].isFavourite = true;
  //   }
  //   notifyListeners();
  // }

  // onHeartIconClickCarousel(Movie movie) {
  //   if (movie.isFavourite) {
  //     _databaseRepo.deleteFavMovie(movie.id);
  //     int index = _jumboMovies.indexOf(movie);
  //     _jumboMovies[index].isFavourite = false;
  //   } else {
  //     _databaseRepo.insertFavMovie(movie);
  //     int index = _jumboMovies.indexOf(movie);
  //     _jumboMovies[index].isFavourite = true;
  //   }
  //   notifyListeners();
  // }
}
