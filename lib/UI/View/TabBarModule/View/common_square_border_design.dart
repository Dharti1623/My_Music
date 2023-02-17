import 'package:flutter/material.dart';

import '../../../../Utils/color_constants.dart';

class CommonSquareDesign extends StatelessWidget {
  const CommonSquareDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 160,
        width: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColor.albumBorderClr,
              width: 5,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
      ),
    );
  }
}