import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

Widget customLoading(){
  return Center(
    child: CircularProgressIndicator(color: AppColor.bgPurple)
  );
}