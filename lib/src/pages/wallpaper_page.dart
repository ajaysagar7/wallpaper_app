// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'package:wallpaper_app_2023/src/models/wallpapert_model.dart';
import 'package:wallpaper_app_2023/src/pages/categories/categories_screen.dart';
import 'package:wallpaper_app_2023/src/providers/wallpapert_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallpaperPage extends StatefulWidget {
  final String? categoryName;
  const WallpaperPage({
    Key? key,
    this.categoryName,
  }) : super(key: key);

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<WallpaperProvider>().callWallpaperApi();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<WallpaperProvider>().wallpapers.clear();
      context
          .read<WallpaperProvider>()
          .callWallpaperApi(category: widget.categoryName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: const Text("Wallpaper HomeScreen"),
        leading: IconButton(
          icon: Icon(Icons.category),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => CategoriesScreen()));
          },
        ),
      ),
      body: Consumer<WallpaperProvider>(
        builder: ((context, provider, child) {
          return WallpaperListWidget(provider, scrollController);
        }),
      ),
    );
  }

  Widget WallpaperListWidget(
      WallpaperProvider provider, ScrollController scrollController) {
    return provider.wallpapers.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: AnimationLimiter(
            child: ListView.builder(
                itemCount: provider.wallpapers.length,
                itemBuilder: (c, i) {
                  return AnimationConfiguration.staggeredGrid(
                      position: i,
                      columnCount: 3,
                      child: ScaleAnimation(
                        curve: Curves.bounceIn,
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 800),
                        scale: 0.2,
                        child: FadeInAnimation(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 800),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  imageUrl: provider.wallpapers[i].regularImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ));
                }),
          ));
  }
}
