import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Utils/color_constants.dart';
import '../../../../Utils/image_constants.dart';

// ignore: must_be_immutable
class PlaySongImage extends StatelessWidget {
  int songDataId;
  PlaySongImage(this.songDataId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 30, color: AppColor.shadowWhiteClr),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: AppColor.bgWhitePinkClr,
              radius: 170,
              child: Center(
                child: ClipOval(
                  child: QueryArtworkWidget(
                    id: songDataId,
                    type: ArtworkType.AUDIO,
                    artworkHeight: 360,
                    artworkWidth: 360,
                    // quality: 0,
                    size: 90,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(27.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(143.0)),
                border: Border.all(
                  color: AppColor.bgBlackClr,
                  width: 10.0,
                ),
                // shape: BoxShape.circle,
                // borderRadius:  BorderRadius.all(Radius.circular(100)),
              ),
              child: CircleAvatar(
                backgroundColor: AppColor.bgWhitePinkClr,
                radius: 133,
                child: Center(
                  child: ClipOval(
                    child: QueryArtworkWidget(
                      id: songDataId,
                      type: ArtworkType.AUDIO,
                      artworkHeight: 266,
                      artworkWidth: 266,
                      size: 500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Image.asset(headImg),
        ],
      ),
    );
  }
}