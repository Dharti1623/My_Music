import 'package:flutter/material.dart';
import 'package:my_music/UI/View/SongModule/View/play_bottom.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Utils/color_constants.dart';
import '../../../../Utils/common_style.dart';
import '../../../CustomWidgets/custom_bottombar.dart';
import 'play_appbar.dart';
import 'play_body.dart';

// ignore: must_be_immutable
class PlaySong extends StatefulWidget {
  SongModel songData;

  PlaySong(this.songData, {Key? key}) : super(key: key);

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  @override
  Widget build(BuildContext context) {
    print('data--->${widget.songData}');
    // return Container(decoration: playScreenBgColor,);
    return SafeArea(
      child: Container(
        decoration: playScreenBgColor,
        child: Scaffold(
          backgroundColor: AppColor.transparentClr,
          appBar: playAppbar(context),
          body: PlayBody(widget.songData),
          bottomNavigationBar: PlayBottom(),

        ),
      ),
    );
  }
}
