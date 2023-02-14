import 'package:flutter/material.dart';

import '../../../../Utils/color_constants.dart';
import '../../../../Utils/common_style.dart';
import '../../../CustomWidgets/custom_icon.dart';

// ignore: must_be_immutable
class PlaySongTitleData extends StatelessWidget {
  String songDataTitle;
  String songDataArtist;
  bool isFav;

  PlaySongTitleData(this.songDataTitle, this.songDataArtist, this.isFav,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('isFav--->$isFav');
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 50, left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              songDataTitle,
              textAlign: TextAlign.center,
              style: playSongTitleTxtStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              songDataArtist!,
              textAlign: TextAlign.center,
              style: playSongSingerTxtStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 3.0,
                      child: CustomIcon(Icons.favorite, Colors.black54, 26)
                    ),
                    isFav
                        ? CustomIcon(Icons.favorite, AppColor.bgHeartClr, 26)
                        : CustomIcon(Icons.favorite, AppColor.bgWhiteClr, 26),
                  ],
                ),
                Text(
                  'Fav',
                  textAlign: TextAlign.center,
                  style: playSongFavTxtStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
