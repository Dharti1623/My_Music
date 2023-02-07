import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

import '../../Utils/common_function.dart';
import '../../Utils/string_constants.dart';
import 'custom_text.dart';

Widget customImageContainer(String imagePath, BuildContext context,bgColor) {
  return Container(
    color: bgColor,
    // color: AppColor.transparent,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height/10,
      bottom: MediaQuery.of(context).size.height/4,
      left: MediaQuery.of(context).size.width/10,
      right: MediaQuery.of(context).size.width/10,
    ),
    child: imageLoad(imagePath),
  );
}

Widget customTextContainer(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height/3,
      bottom: 0,
      left: MediaQuery.of(context).size.width/10,
      right: MediaQuery.of(context).size.width/10,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        customTextErrorScreen(text)
      ],
    ),
  );
}