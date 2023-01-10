import 'package:get_it/get_it.dart';
import 'package:wallpaper_app_2023/src/providers/wallpapert_provider.dart';
import 'package:wallpaper_app_2023/src/repositories/wallpapert/wallpaper_repo.dart';

final getIt = GetIt.instance;

Future<void> setUpLocator() async {
  //* for repo user registerLazySingleton

  getIt.registerLazySingleton(() => WallpaperRepositiroy());

  //* for provider user registerFactory()

  getIt.registerFactory(() => WallpaperProvider(getIt()));

  //* for others use registerLazySingleton
}
