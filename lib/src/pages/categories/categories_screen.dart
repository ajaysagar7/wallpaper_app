import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app_2023/src/pages/wallpaper_page.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController bottomToUpController;
  late Animation<dynamic> sliderAnim;

  @override
  void initState() {
    bottomToUpController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    sliderAnim = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, -1.0))
        .animate(
            CurvedAnimation(parent: bottomToUpController, curve: Curves.ease));
    super.initState();
  }

  List categories = [
    "Abstract",
    "Animals",
    "Art",
    "Birds",
    "Black And White",
    "Christmas",
    "Desserts And Candies",
    "Fashion",
    "Flowers",
    "Food",
    "Insects",
    "Landscapes",
    "Liquid",
    "Motors",
    "Music",
    "New",
    "Nightlife",
    "Optical Illusions",
    "Pets",
    "Plants",
    "Quotes",
    "Sea",
    "Travel",
    "Textures",
    "Universe",
    "Urban",
    "Vintage",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wallpaper Categories"),
        ),
        body: AnimationLimiter(
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (c, i) {
                return AnimationConfiguration.staggeredList(
                    position: i,
                    child: SlideAnimation(
                      curve: Curves.ease,
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 600),
                      verticalOffset: 100,
                      child: ScaleAnimation(
                        curve: Curves.ease,
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 600),
                        scale: 0.3,
                        child: FadeInAnimation(
                            curve: Curves.ease,
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 600),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => WallpaperPage(
                                              categoryName:
                                                  categories[i].toString(),
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                alignment: Alignment.center,
                                height: size.height * .2,
                                width: size.width * .8,
                                decoration: BoxDecoration(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  categories[i].toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ));
              }),
        ));
  }
}
