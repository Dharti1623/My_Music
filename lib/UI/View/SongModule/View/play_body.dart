import 'dart:async';
import 'dart:math';
// ignore: import_of_legacy_library_into_null_safe
import 'package:amseekbar/amseekbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'play_song_image.dart';
import 'play_song_title_data.dart';

// ignore: must_be_immutable
class PlayBody extends StatelessWidget {
  SongModel songData;
  bool isFavorite;
  double totalTime;

  PlayBody(this.songData, this.isFavorite, this.totalTime, {Key? key}) : super(key: key);
  final List<double> values = [];

  RxDouble val = 0.0.obs;
  Timer? progressTimer;
  RxBool done = false.obs;
  // double totalTime = ((1 * 3600) + (48.0 * 60) + 23);

  _resumeProgressTimer() {
    progressTimer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      val.value = val.value + 1;
      if (val.value >= totalTime) {
        val.value = totalTime;
        progressTimer?.cancel();
        done.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('songData---->$totalTime');
    return Padding(
      padding: const EdgeInsets.only(top: 52, bottom: 50, right: 15, left: 15),
      child: Column(
        children: <Widget>[
          PlaySongImage(songData.id),
          PlaySongTitleData(songData.title, songData.artist!, isFavorite),
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                child: SeekBar(
                  currentTime: val.value,
                  durationTime: totalTime,
                  barColor: AppColor.bgPurpleClr,
                  onStartTrackingTouch: () {
                    if (!done.value) {
                      progressTimer?.cancel();
                    }
                  },
                  onProgressChanged: (value) {
                    val.value = value * totalTime;
                  },
                  onStopTrackingTouch: () {
                    if (!done.value) {
                      _resumeProgressTimer();
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
