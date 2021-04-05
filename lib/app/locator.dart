import 'package:get_it/get_it.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/movie_interactor.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/main/main_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => DetailViewModel());

//  locator.registerLazySingleton(() => NavigationService());

  // Interactor
  locator.registerFactory(() => MovieInteractor());

  // Repos
  locator.registerLazySingleton(() => SecretRepo(secretPath: "assets/secrets.json"));
  locator.registerLazySingleton(() => JsonRepo());
}
