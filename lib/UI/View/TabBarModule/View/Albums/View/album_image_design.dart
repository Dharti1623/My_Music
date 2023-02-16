import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

import '../../../../../../../../Utils/image_constants.dart';
class AlbumImageDesign extends StatelessWidget {
  const AlbumImageDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Center(
          child: Container(
            height: 160,
            width: 170,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColor.albumBorderClr,
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 18, right:30),
            child: Center(child: Image.asset(ellipse17, height: 130))),
        Padding(
            padding: const EdgeInsets.only(top: 18,left: 10),
            child: Center(child: Image.asset(ellipse18, height: 132))),
        Padding(
            padding: const EdgeInsets.only(top: 18, left: 50),
            child: Center(child: Image.asset(ellipse19, height: 134))),
      ],
    );
  }
}