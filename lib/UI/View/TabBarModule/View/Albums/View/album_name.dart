import 'package:flutter/material.dart';

import '../../../../../../Utils/common_style.dart';

// ignore: must_be_immutable
class AlbumNameTxt extends StatelessWidget {
  String albumName;
  AlbumNameTxt(this.albumName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(albumName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: albumTitleTxtStyle),
        ));
  }
}
