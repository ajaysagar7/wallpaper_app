// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'package:wallpaper_app_2023/src/models/wallpapert_model.dart';
import 'package:wallpaper_app_2023/src/repositories/wallpapert/wallpaper_repo.dart';

enum WallpaperState {
  uninitialized,
  refreshing,
  initial_fetching,
  more_fetching,
  fetched,
  no_more_data,
  error,
  initial,
  loading,
  loaded,
  failed,
}

class WallpaperProvider with ChangeNotifier {
  final WallpaperRepositiroy wallpaperRepositiroy;

  //* latest provider funtions

  int pagee = 1;
  int per_page = 10;

  String _search = "nature";

  WallpaperProvider(this.wallpaperRepositiroy);

  set searchFunction(String value) {
    _search = value;
    notifyListeners();
  }

  set pageFunction(int value) {
    pagee = value;
    notifyListeners();
  }

  List<WallPaperModel> _wallpapers = [];
  List<WallPaperModel> get wallpapers => _wallpapers;

  setWallpapersList(List<WallPaperModel> value) {
    _wallpapers = value;
    notifyListeners();
  }

  Future<void> callWallpaperApi({String? category}) async {
    List<WallPaperModel> list = await wallpaperRepositiroy.getWallpapers(
        category: category ?? "Avengers", page: pagee, perPage: per_page);
    if (per_page == 30) {
      pagee = pagee + 1;
      per_page = 10;
      notifyListeners();
    } else {
      per_page = per_page + 10;
      // page = page;
      notifyListeners();
    }
    _wallpapers.addAll(list);
    notifyListeners();
  }
}
