import 'package:flutter/material.dart';

import '../../Utils/color_constants.dart';
import '../../Utils/image_constants.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  IconData icon;
  Color iconClr;
  double iconSize;

  CustomIcon(this.icon, this.iconClr, this.iconSize, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconClr, size: iconSize);
  }
}

// ignore: must_be_immutable
class CustomImageIcon extends StatelessWidget {
  String iconImage;
  Color iconImageClr;
  double iconImageSize;
  CustomImageIcon(this.iconImage, this.iconImageClr, this.iconImageSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(iconImage,color: iconImageClr,width: iconImageSize,height: iconImageSize);
  }
}
