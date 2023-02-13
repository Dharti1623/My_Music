import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

Widget customText(String data) {
  return Text(data);
}

Widget customTextErrorScreen(String text) {
  return Text(
    text,
    maxLines: 4,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w400,fontFamily: 'Pacifico',color:AppColor.iconBlackClr),
  );
}
