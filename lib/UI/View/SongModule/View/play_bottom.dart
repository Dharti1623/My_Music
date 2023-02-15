import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/image_constants.dart';

import '../../../../Utils/color_constants.dart';
import '../../../../Utils/common_style.dart';
import '../../../CustomWidgets/custom_icon.dart';

// ignore: must_be_immutable
class PlayBottom extends StatelessWidget {
  AudioPlayer songVal;
  RxBool isSongPlaying;

  PlayBottom(this.songVal, this.isSongPlaying, {Key? key}) : super(key: key);

  pausePlay(AudioPlayer song) async {
    if (isSongPlaying.value == true) {
      await song.pause();
    } else {
      await song.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 120,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: btnStyle1,
                              child: Image.asset(iconShuffleImg,
                                  height: 30, width: 30)))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: btnStyle,
                              child: Image.asset(backwardImg,
                                  height: 58, width: 58)))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              onPressed: () {
                                pausePlay(songVal);
                                isSongPlaying.value = !isSongPlaying.value;

                              },
                              style: btnStyle,
                              child: Image.asset(playImg,
                                  height: 98, width: 98)))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: btnStyle,
                              child: Image.asset(forwardImg,
                                  height: 58, width: 58)))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: btnStyle1,
                              child: Image.asset(iconRepeatImg,
                                  height: 30, width: 30)))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
