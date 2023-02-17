import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonImageDesign extends StatelessWidget {
  String imageName;
  double imageHeight;
  double rightPadding;
  double leftPadding;
  CommonImageDesign(this.imageName,this.imageHeight,this.leftPadding,this.rightPadding,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 18, right:rightPadding,left: leftPadding),
        child: Center(child: Image.asset(imageName, height: imageHeight)));
  }
}
