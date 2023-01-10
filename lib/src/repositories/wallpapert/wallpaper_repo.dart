import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wallpaper_app_2023/src/models/wallpapert_model.dart';
import 'package:wallpaper_app_2023/src/repositories/Dio%20Client/api_constants.dart';

class WallpaperRepositiroy {
  Dio dio = Dio();

  Future<List<WallPaperModel>> getWallpapers(
      {required int page,
      required int perPage,
      required String category}) async {
    List<WallPaperModel> wallpapers = [];
    try {
      Response response = await dio.get(
        "https://api.unsplash.com/search/photos/?query=$category&client_id=cyyi5W62rmCANLB2NdGj0ezDjkNrVb9eYb82Btoog84&page=$page&per_page=$perPage",
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        var responseBody = response.data["results"] as List;
        log(page.toString());
        // log(perPage.toString());
        log(responseBody.length.toString());
        log(responseBody[0]["id"].toString());

        wallpapers =
            responseBody.map((e) => WallPaperModel.fromJson(e)).toList();
        log(wallpapers[2].toJson().toString());
      } else {
        log("no data found sorry");
      }
    } on SocketException {
      log("no  internet found");
    } catch (e) {
      log(e.toString());
    }
    return wallpapers;
  }
}
