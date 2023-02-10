import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Utils/common_style.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_bottombar.dart';
import '../../TabBarModule/View/albums.dart';
import '../../TabBarModule/View/artists.dart';
import '../../TabBarModule/View/favorites.dart';
import '../../TabBarModule/View/playlists.dart';
import '../../TabBarModule/View/tracks.dart';

final OnAudioQuery audioQueryEx = OnAudioQuery();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final OnAudioQuery audioQueryEx = OnAudioQuery();
  late TabController tabController;
  var isBottomBarVisible = false .obs;
  final player = AudioPlayer();

  @override
  void initState() {
    tabController =  TabController(length: tabs.length, vsync: this, initialIndex: 2);
    // final duration = await player.setUrl('https://foo.com/bar.mp3');
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Tab> tabs = <Tab>[
    Tab(child: Text(playlistsTxt, style: tabBarTxtStyle)),
    Tab(child: Text(favoritesTxt, style: tabBarTxtStyle)),
    Tab(child: Text(tracksTxt, style: tabBarTxtStyle)),
    Tab(child: Text(albumsTxt, style: tabBarTxtStyle)),
    Tab(child: Text(artistsTxt, style: tabBarTxtStyle)),
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
              backgroundColor: Colors.transparent,
              appBar: customAppBar(
                context,
                tabs,
                false,
                tabController,
              ),
              body: TabBarView(
                  controller: tabController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    PlayLists(),
                    Favorites(),
                    tracks(context, audioQueryEx,player),
                    Albums(),
                    Artists()
                  ]),
              bottomNavigationBar: Obx(
                    () =>
                isBottomBarVisible.value
                    ? customBottomNavigationBar(context)
                    : SizedBox(),
              ),
            ),
          ),
        ));
  }}

Widget getAllSongs() {
  // final OnAudioQuery audioQueryEx = OnAudioQuery();
  return FutureBuilder<List<SongModel>>(
    // Default values:
    future: audioQueryEx.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    ),
    builder: (context, item) {
      // Loading content
      if (item.data == null) return const CircularProgressIndicator();

      // When you try "query" without asking for [READ] or [Library] permission
      // the plugin will return a [Empty] list.
      if (item.data!.isEmpty) return const Text("Nothing found!");

      // You can use [item.data!] direct or you can create a:
      // List<SongModel> songs = item.data!;
      return ListView.builder(
        itemCount: item.data!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(item.data![index].title),
            subtitle: Text(item.data![index].artist ?? "No Artist"),
            trailing: const Icon(Icons.arrow_forward_rounded),
            // This Widget will query/load image. Just add the id and type.
            // You can use/create your own widget/method using [queryArtwork].
            leading: QueryArtworkWidget(
              id: item.data![index].id,
              type: ArtworkType.AUDIO,
            ),
          );
        },
      );
    },
  );
}