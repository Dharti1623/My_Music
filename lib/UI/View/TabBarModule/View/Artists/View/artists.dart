import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../../Utils/common_style.dart';
import '../../../../../../Utils/image_constants.dart';
import '../../../../../../Utils/no_data_found.dart';
import '../../../../../CustomWidgets/custom_loading.dart';
import 'artist_image_design.dart';
import 'artist_name.dart';
import 'artist_no_of_songs.dart';

// ignore: must_be_immutable
class Artists extends StatelessWidget {
  OnAudioQuery audioQueryTracks;
  RxBool isBottomBarVisible;

  // AudioPlayer player;
  Artists(this.audioQueryTracks, this.isBottomBarVisible,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Dharti--->artist");
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SafeArea(
          child: StreamBuilder<List<ArtistModel>>(
        stream: audioQueryTracks
            .queryArtists(
                ignoreCase: true,
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL)
            .asStream()
            .asBroadcastStream(
                onCancel: (subscription) => subscription.cancel()),
        builder: (context, item) {
          print('item--->$item');
          if (item.data == null) return customLoading();
          if (item.data!.isEmpty) {
            return const NoDataFound();
          }
          return GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 10.0,
              children: List.generate(item.data!.length, (index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ArtistImageDesign(),
                      ArtistNameTxt(item.data![index].artist),
                      ArtistNoOfTracks(item.data![index].numberOfTracks.toString()),
                    ],
                  ),
                );
              }));
        },
      )),
    );
  }
}

