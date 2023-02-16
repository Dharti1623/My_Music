import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../../../../Utils/no_data_found.dart';
import '../../../../../CustomWidgets/custom_loading.dart';
import 'album_image_design.dart';
import 'album_name.dart';
import 'album_no_of_songs.dart';

// ignore: must_be_immutable
class Albums extends StatelessWidget {
  OnAudioQuery audioQueryTracks;
  RxBool isBottomBarVisible;

  // AudioPlayer player;
  Albums(this.audioQueryTracks, this.isBottomBarVisible, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Dharti--->album");
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: SafeArea(
          child: StreamBuilder<List<AlbumModel>>(
        stream: audioQueryTracks
            .queryAlbums(
                ignoreCase: true,
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL)
            .asStream()
            .asBroadcastStream(
                onCancel: (subscription) => subscription.cancel()),
        builder: (context, item) {
          if (item.data == null) return customLoading();
          if (item.data!.isEmpty) {
            return const NoDataFound();
          }
          return GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 10.0,
              children: List.generate(item.data!.length, (index) {
                return InkWell(
                  onTap: () {
                    print("Dharti--->album-->${item.data!}");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AlbumImageDesign(),
                      AlbumNameTxt(item.data![index].album),
                      AlbumNoOfSong(item.data![index].numOfSongs.toString()),
                    ],
                  ),
                );
              }));
        },
      )),
    );
  }
}
