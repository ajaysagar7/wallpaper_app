// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:wallpaper_app_2023/locator/locator.dart';
// import 'package:wallpaper_app_2023/src/models/wallpapert_model.dart';
// import 'package:wallpaper_app_2023/src/providers/wallpapert_provider.dart';
// import 'package:wallpaper_app_2023/src/repositories/wallpapert/wallpaper_repo.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _refreshController = RefreshController();
//   @override
//   void initState() {
//     // getIt.get<WallpaperRepositiroy>().getWallpapers(page: 0, perPage: 100);
//     // getIt
//     //     .get<WallpaperProvider>()
//     //     .getWallpapertListsFromProvider(isRefreshed: false);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context
//           .read<WallpaperProvider>()
//           .getWallpapertListsFromProvider(isRefreshed: false);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("wallpaper App 2023"),
//       ),
//       body: Consumer<WallpaperProvider>(builder: (context, provider, _) {
//         if (provider.state == WallpaperState.loaded) {
//           return _WallpaperListWidget(
//               provider: provider, refreshController: _refreshController);
//         } else if (provider.state == WallpaperState.loading) {
//           return provider.wallpapertList.isEmpty
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10),
//                   itemCount: provider.wallpapertList.length,
//                   itemBuilder: (c, i) {
//                     WallPaperModel model = provider.wallpapertList[i];
//                     return Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(4.0),
//                         child: Image.network(
//                           model.regularImage.toString(),
//                           height: 200,
//                           width: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   });
//         } else if (provider.state == WallpaperState.initial) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.redAccent,
//             ),
//           );
//         } else if (provider.state == WallpaperState.failed) {
//           return Center(
//             child: Text(provider.errorMessage.toString()),
//           );
//         } else {
//           return Container();
//         }
//       }),
//     );
//   }

//   Widget _WallpaperListWidget(
//       {required WallpaperProvider provider,
//       required RefreshController refreshController}) {
//     return SmartRefresher(
//       enablePullDown: false,
//       enablePullUp: true,
//       controller: RefreshController(initialRefresh: false),
//       onLoading: () async {
//         await provider
//             .getWallpapertListsFromProvider(isRefreshed: true)
//             .then((value) => refreshController.loadComplete())
//             .onError((error, stackTrace) =>
//                 Fluttertoast.showToast(msg: error.toString()));
//       },
//       child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
//           itemCount: provider.wallpapertList.length,
//           itemBuilder: (c, i) {
//             WallPaperModel model = provider.wallpapertList[i];
//             return Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(4.0),
//                 child: Image.network(
//                   model.regularImage.toString(),
//                   height: 200,
//                   width: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
