import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/UI/View/SongModule/View/play_bottom.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../Utils/color_constants.dart';
import '../../../../Utils/common_style.dart';
import 'play_appbar.dart';
import 'play_body.dart';

// ignore: must_be_immutable
class PlaySong extends StatefulWidget {
  SongModel songData;
  bool isSongFavorite;
  PlaySong(this.songData,this.isSongFavorite, {Key? key}) : super(key: key);

  @override
  State<PlaySong> createState() => _PlaySongState();
  // final player = AudioPlayer();
}

class _PlaySongState extends State<PlaySong> {
  final player = AudioPlayer().obs;

  setSource(AudioPlayer song) async {
    await song.setSourceDeviceFile(widget.songData.data);
  }
  playSource(AudioPlayer song) async {
    await song.play(DeviceFileSource(widget.songData.data));
  }
  stopPlay(AudioPlayer song) async {
    await song.stop();
  }
  @override
  void initState() {
    // final player = AudioPlayer().obs;
    setSource(player.value);
    playSource(player.value);
    super.initState();
  }
  @override
  void dispose() {
    // setSource(player.value);
    stopPlay(player.value);
    print('dispose--->');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('data--->${widget.songData}');
    // print('isSongFavorite--->${widget.isSongFavorite}');
    return SafeArea(
      child: Container(
        decoration: playScreenBgColor,
        child: Scaffold(
          backgroundColor: AppColor.transparentClr,
          appBar: playAppbar(context),
          body: PlayBody(widget.songData,widget.isSongFavorite),
          bottomNavigationBar: PlayBottom(),
        ),
      ),
    );
  }

}

