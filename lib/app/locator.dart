import 'package:get_it/get_it.dart';
import 'package:movies/data/network/json_repo.dart';
import 'package:movies/data/network/secret_repo.dart';
import 'package:movies/domain/database_repo.dart';
import 'package:movies/domain/detail_interactor.dart';
import 'package:movies/domain/mappers/date_time_mapper.dart';
import 'package:movies/domain/mappers/movie_mapper.dart';
import 'package:movies/domain/main_interactor.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/main/main_viewmodel.dart';
import '../data/network/interceptor/spring_api_interceptor.dart';
import '../domain/user_interactor.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => DetailViewModel());

//  locator.registerLazySingleton(() => NavigationService());

  // Mappers
  locator.registerFactory(() => MovieMapper());
  locator.registerFactory(() => DateTimeMapper());

  // Interactors
  locator.registerFactory(() => MovieInteractor());
  locator.registerFactory(() => DetailInteractor());
  locator.registerFactory(() => UserInteractor());

  // Repos
  locator.registerLazySingleton(() => SecretRepo(secretPath: "assets/secrets.json"));
  locator.registerLazySingleton(() => JsonRepo());
  locator.registerLazySingleton(() => DatabaseRepo());

  // Api
  locator.registerFactory(() => SpringApiInterceptor());

}
