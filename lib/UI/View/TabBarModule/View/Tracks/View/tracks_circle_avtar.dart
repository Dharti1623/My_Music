import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../../Utils/color_constants.dart';
// ignore: must_be_immutable
class TracksCircleAvtar extends StatelessWidget {
  String avtarImg;
  int itemId;
  TracksCircleAvtar( this.avtarImg,this.itemId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9, right: 16),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: AppColor.shadowBlackClr, offset: const Offset(3, 5))
          ],
        ),
        child: CircleAvatar(
          backgroundColor: AppColor.bgWhitePinkClr,
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
}