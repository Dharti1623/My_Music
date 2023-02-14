import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/color_constants.dart';
import '../../../../Utils/image_constants.dart';
import '../../../CustomWidgets/custom_icon.dart';


playAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.transparentClr,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: CustomImageIcon(iconArrowIosDownwardImg, AppColor.backIconClr,40)),
      actions: [
        IconButton(onPressed: () {},icon: CustomImageIcon(iconBarChartImg, AppColor.backIconClr,40)),
        IconButton(onPressed: () {},icon: CustomImageIcon(iconVolumeUpImg, AppColor.backIconClr,40)),
        IconButton(onPressed: () {},icon: CustomImageIcon(iconMoreImg, AppColor.backIconClr,40)),
      //   IconButton(onPressed: () {},icon: CustomIcon(Icons.stacked_bar_chart, AppColor.backIconClr,40)),
      //   IconButton(onPressed: () {},icon: CustomIcon(Icons.volume_up, AppColor.backIconClr,40)),
      //   IconButton(onPressed: () {},icon: CustomIcon(Icons.more_vert, AppColor.backIconClr,40)),
      ],
    );
  }
