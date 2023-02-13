import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_music/UI/View/SongModule/View/play_song.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../../Config/Services/network_manager.dart';
import '../../../../../../Utils/common_style.dart';
import '../../../../../../Utils/image_constants.dart';
import '../../../../../../Utils/no_data_found.dart';
import '../../../../../CustomWidgets/customIcon.dart';
import '../../../../../CustomWidgets/custom_loading.dart';
import '../../artists.dart';
import 'track_divider.dart';
import 'track_title.dart';
import 'tracks_circle_avtar.dart';

// ignore: must_be_immutable
class Tracks extends StatelessWidget {
  OnAudioQuery audioQueryTracks;
  AudioPlayer player;
  Tracks(this.audioQueryTracks, this.player, {Key? key}) : super(key: key);
  final _streamController = StreamController<List<SongModel>>();
  @override
  Widget build(BuildContext context) {
    print("Dharti--->Tracks");
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: SafeArea(
          child: StreamBuilder<List<SongModel>>(
            stream: audioQueryTracks.querySongs(
              sortType: null,
              orderType: OrderType.ASC_OR_SMALLER,
              uriType: UriType.EXTERNAL,
              ignoreCase: true,
            ).asStream().asBroadcastStream(onCancel: (subscription) => subscription.cancel(),),
            builder: (context, item) {
              if (item.data == null) return customLoading();
              if (item.data!.isEmpty) {
                return NoDataFound();
              }
              List<bool> chkFav =
                  List.filled(item.data!.length, false, growable: true).obs;
              return ListView.separated(
                separatorBuilder: (context, index) => tracksDivider(2),
                physics: BouncingScrollPhysics(),
                itemCount: item.data!.length,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                    onTap: () {
                      print('id--->${item.data![index]}');
                      Get.to(() => PlaySong(item.data![index]));
                    },
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 27, right: 15, bottom: 6),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    TracksCircleAvtar(
                                        placeHolderImg, item.data![index].id),
                                    TracksTitle(item.data![index].title,
                                        item.data![index].artist)
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        chkFav[index] = !chkFav[index];
                                        print('objec->');
                                      },
                                      child: chkFav[index]
                                          ? customIcon(
                                          Icons.favorite, AppColor.bgRedClr, 32)
                                          : customIcon(Icons.favorite,
                                          AppColor.bgWhiteClr, 32)),
                                  IconButton(
                                    onPressed: () {},
                                    icon: customIcon(Icons.more_vert_sharp,
                                        AppColor.iconBlackClr, 32),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              );
            },
          )),
    );
  }
}
