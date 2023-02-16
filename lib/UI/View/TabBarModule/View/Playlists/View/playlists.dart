import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_music/UI/View/SongModule/View/play_song_main.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../Utils/common_function.dart';
import '../../../../../../../../Utils/image_constants.dart';
import '../../../../../../../../Utils/no_data_found.dart';
import '../../../../../../../../Utils/string_constants.dart';
import '../../../../../../Utils/common_style.dart';
import '../../../../../CustomWidgets/custom_icon.dart';
import '../../../../../CustomWidgets/custom_loading.dart';
import '../../Tracks/View/track_divider.dart';
import '../../Tracks/View/track_title.dart';
import '../../Tracks/View/tracks_circle_avtar.dart';

// ignore: must_be_immutable
class PlayLists extends StatelessWidget {
  OnAudioQuery audioQueryTracks;
  RxBool isBottomBarVisible;

  // AudioPlayer player;
  PlayLists(this.audioQueryTracks, this.isBottomBarVisible,
      /*this.player,*/
      {Key? key})
      : super(key: key);

  // final _streamController = StreamController<List<SongModel>>();
  @override
  Widget build(BuildContext context) {
    print("Dharti--->playlist");
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SafeArea(
          child: StreamBuilder<List<PlaylistModel>>(
        stream: audioQueryTracks.queryPlaylists(ignoreCase: true,sortType: null,orderType: OrderType.ASC_OR_SMALLER,uriType:UriType.EXTERNAL).asStream().asBroadcastStream(onCancel: (subscription) => subscription.cancel()),
        builder: (context, item) {
          print('item--->$item');
          if (item.data == null) return customLoading();
          if (item.data!.isEmpty) {
            return const NoDataFound();
          }
          List<bool> chkFav =
              List.filled(item.data!.length, false, growable: true).obs;
          return ListView.separated(
            separatorBuilder: (context, index) => tracksDivider(2),
            physics: BouncingScrollPhysics(),
            itemCount: item.data!.length,
            itemBuilder: (context, index) {
              return GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10.0,
                  children: List.generate(item.data!.length, (index) {
                    return InkWell(
                      onTap: (){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColor.albumBorderClr,
                                        width: 5,
                                        style: BorderStyle.solid,
                                        strokeAlign: BorderSide.strokeAlignInside),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20, right:30),
                                  child: Center(child: Image.asset(ellipse17, height: 130))),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 10),
                                  child: Center(child: Image.asset(ellipse18, height: 132))),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 50),
                                  child: Center(child: Image.asset(ellipse19, height: 134))),
                            ],
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(item.data![index].playlist,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: albumTitleTxtStyle),
                              )),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                    '${item.data![index].numOfSongs.toString()} Tracks',
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: albumTrackTxtStyle),
                              )),
                        ],
                      ),
                    );
                  }));
            },
          );
        },
      )),
    );
  }
}
