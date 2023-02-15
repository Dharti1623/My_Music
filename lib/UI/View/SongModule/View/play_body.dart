import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'play_song_image.dart';
import 'play_song_title_data.dart';
import 'package:audio_progress_bars/audio_progress_bars.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wave_progress_bars/wave_progress_bars.dart';
import 'dart:math';

// ignore: must_be_immutable
class PlayBody extends StatelessWidget {
  SongModel songData;
  bool isFavorite;

  PlayBody(this.songData,this.isFavorite, {Key? key}) : super(key: key);
  final List<double> values = [];
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    for (var i = 0; i < 100; i++) {
      values.add(rng.nextInt(70) * 1.0);
    }
    // print('songData---->$songData');
    return Padding(
      padding: const EdgeInsets.only(top: 52, bottom: 50, right: 15, left: 15),
      child: Column(
        children: <Widget>[
          PlaySongImage(songData.id),
          PlaySongTitleData(songData.title, songData.artist!,isFavorite),
        /*  AudioProgressBar1(20,5),*/

          /*Container(
            color: Colors.transparent,
            child: Center(
              child: WaveProgressBar(
                progressPercentage: 50,
                listOfHeights: values,
                width: 300,
                initalColor: AppColor.bgWhiteClr,
                progressColor: AppColor.backIconClr,
                backgroundColor: AppColor.bgPinkClr,
                timeInMilliSeconds: 2000,
                isHorizontallyAnimated: false,
                isVerticallyAnimated: false,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

