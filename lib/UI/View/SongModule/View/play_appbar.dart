import 'package:flutter/material.dart';

import '../../../../Utils/color_constants.dart';
import '../../../CustomWidgets/customIcon.dart';


playAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.transparentClr,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: customIcon(Icons.keyboard_arrow_down_sharp, AppColor.backIconClr,44)),
      actions: [
        IconButton(onPressed: () {},icon: customIcon(Icons.stacked_bar_chart, AppColor.backIconClr,40)),
        IconButton(onPressed: () {},icon: customIcon(Icons.volume_up, AppColor.backIconClr,40)),
        IconButton(onPressed: () {},icon: customIcon(Icons.more_vert, AppColor.backIconClr,40)),
      ],
    );
  }
