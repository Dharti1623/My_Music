import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Utils/common_style.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_bottombar.dart';
import '../../TabBarModule/View/Albums/View/albums.dart';
import '../../TabBarModule/View/Artists/View/artists.dart';
import '../../TabBarModule/View/Favorites/View/favorites.dart';
import '../../TabBarModule/View/Playlists/View/playlists.dart';
import '../../TabBarModule/View/Tracks/View/tracks.dart';

final OnAudioQuery audioQueryEx = OnAudioQuery();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final OnAudioQuery audioQueryEx = OnAudioQuery();
  late TabController tabController;
  var isBottomBarVisible = false.obs;

  // final player = AudioPlayer();

  @override
  void initState() {
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 2);
    print("Dharti -->homepage");
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Tab> tabs = <Tab>[
    const Tab(child: Text(playlistsTxt, style: tabBarTxtStyle)),
    const Tab(child: Text(favoritesTxt, style: tabBarTxtStyle)),
    const Tab(child: Text(tracksTxt, style: tabBarTxtStyle)),
    const Tab(child: Text(albumsTxt, style: tabBarTxtStyle)),
    const Tab(child: Text(artistsTxt, style: tabBarTxtStyle)),
  ];

// List<Widget> tabContent = [PlayLists(),Favorites(),Tracks(),Albums(),Artists()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 2,
        length: tabs.length,
        child: SafeArea(
          child: Container(
            decoration: screenBgColor,
            child: Scaffold(
              backgroundColor: AppColor.transparentClr,
              appBar: customAppBar(context, tabs, false, tabController),
              body: TabBarView(
                  controller: tabController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    PlayLists(audioQueryEx, isBottomBarVisible),
                    Favorites(),
                    Tracks(audioQueryEx, isBottomBarVisible),
                    Albums(audioQueryEx, isBottomBarVisible),
                    Artists(audioQueryEx, isBottomBarVisible),
                  ]),
              bottomNavigationBar: Obx(
                () => isBottomBarVisible.value
                    ? const CustomBottomNavigationBar()
                    : const SizedBox(),
              ),
            ),
          ),
        ));
  }
}
