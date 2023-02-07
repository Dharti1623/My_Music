import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Utils/common_style.dart';
import '../../../../Utils/image_constants.dart';
import '../../../../Utils/no_data_found.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/customIcon.dart';
import '../../../CustomWidgets/custom_loading.dart';

Widget tracks(BuildContext context, OnAudioQuery audioQueryTracks) {
  final _streamController = StreamController<List<SongModel>>();
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
                                  tracksCircleAvtar(
                                      placeHolderImg, item.data![index].id),
                                  tracksTitle(item.data![index].title,
                                      item.data![index].artist)
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      chkFav[index] = !chkFav[index];
                                      print('objec->t');
                                    },
                                    child: chkFav[index]
                                        ? customIcon(
                                            Icons.favorite, AppColor.bgRed, 32)
                                        : customIcon(Icons.favorite,
                                            AppColor.bgWhite, 32)),
                                IconButton(
                                  onPressed: () {},
                                  icon: customIcon(Icons.more_vert_sharp,
                                      AppColor.iconBlack, 32),
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

Widget tracksCircleAvtar(avtarImg, itemId) {
  return Padding(
    padding: EdgeInsets.only(bottom: 9, right: 16),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 5, color: AppColor.shadowClr, offset: Offset(3, 5))
        ],
      ),
      child: CircleAvatar(
        backgroundColor: AppColor.bgWhitePink,
        radius: 47,
        child: Center(
          child: ClipOval(
            child: QueryArtworkWidget(
              id: itemId,
              type: ArtworkType.AUDIO,
              artworkHeight: 94,
              artworkWidth: 94,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget tracksTitle(songTitleName, singerName) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(
        top: 23,
        bottom: 32,
        // right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songTitleName,
            style: trackTitleTxtStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(singerName, style: trackSubTitleTxtStyle),
        ],
      ),
    ),
  );
}

Widget tracksDivider(double lineThickNess) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Divider(
        indent: 5.0,
        color: AppColor.bgWhite,
        thickness: lineThickNess,
      ));
}
