import 'package:flutter/material.dart';

import '../../../../../../Utils/color_constants.dart';
Widget tracksDivider(double lineThickNess) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Divider(
        indent: 5.0,
        color: AppColor.bgWhiteClr,
        thickness: lineThickNess,
      ));
}