import 'package:flutter/material.dart';

import '../../../../../../Utils/common_style.dart';

// ignore: must_be_immutable
class AlbumNoOfSong extends StatelessWidget {
  String albumNoSongs;
  AlbumNoOfSong(this.albumNoSongs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
              '$albumNoSongs Tracks',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: albumTrackTxtStyle),
        ));
  }
}