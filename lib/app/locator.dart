import 'package:get_it/get_it.dart';
import 'package:movies/network/json_repo.dart';
import 'package:movies/network/secret_repo.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/main/main_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => DetailViewModel());

//  locator.registerLazySingleton(() => NavigationService());

  // Repos
  locator.registerLazySingleton(() => SecretRepo(secretPath: "assets/secrets.json"));
  locator.registerLazySingleton(() => JsonRepo());
}
