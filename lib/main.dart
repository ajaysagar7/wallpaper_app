import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_2023/locator/locator.dart';
import 'package:wallpaper_app_2023/src/pages/categories/categories_screen.dart';
import 'package:wallpaper_app_2023/src/pages/homepage.dart';
import 'package:wallpaper_app_2023/src/pages/login_page.dart';
import 'package:wallpaper_app_2023/src/pages/wallpaper_page.dart';
import 'package:wallpaper_app_2023/src/providers/wallpapert_provider.dart';
import 'package:wallpaper_app_2023/src/repositories/wallpapert/wallpaper_repo.dart';

Future<void> main() async {
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // WallpaperRepositiroy().getWallpapers(page: 1, perPage: 100);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (c) => WallpaperProvider(getIt.get<WallpaperRepositiroy>()))
      ],
      child: MaterialApp(
        title: 'Wallpaper App 2023',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WallpaperPage(),
      ),
    );
  }
}
