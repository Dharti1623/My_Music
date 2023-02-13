import 'package:flutter/material.dart';

import '../../../../../../Utils/common_style.dart';

// ignore: must_be_immutable
class TracksTitle extends StatelessWidget {
  String songTitleName;
  String? singerName;
  TracksTitle(this.songTitleName,this.singerName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
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
            Text(singerName!, style: trackSubTitleTxtStyle),
          ],
        ),
      ),
    );
  }
}
