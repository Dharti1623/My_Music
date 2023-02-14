import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import '../../Utils/image_constants.dart';
import 'custom_icon.dart';

customAppBar(
    BuildContext context, tabs, addVisibility, TabController tabController) {
  RxBool isDarkModeEnable = false.obs;
  void onStateChanged(isDarkModeEnable) {
    if (isDarkModeEnable == true) {
      isDarkModeEnable = !isDarkModeEnable;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDarkModeEnable = !isDarkModeEnable;
      Get.changeTheme(ThemeData.light());
    }
  }

  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(18),
      ),
    ),
    backgroundColor: AppColor.bgPinkClr,
    title: Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 43),
      child: Image.asset(appBarImg),
    ),
    actions: [
      Visibility(
        visible: addVisibility,
        child: IconButton(
            onPressed: () {},
            // icon: Icon(Icons.add_outlined,color: AppColor.bgBlackClr,size: 42)
            icon: CustomImageIcon(iconPlusImg, AppColor.backIconClr, 42)),
      ),
      Obx(() => DayNightSwitcher(
            isDarkModeEnabled: isDarkModeEnable.value,
            onStateChanged: onStateChanged,
            dayBackgroundColor: AppColor.bgPurpleClr,
            nightBackgroundColor: AppColor.bgPurpleClr,
            sunColor: AppColor.bgSunClr,
            cloudsColor: AppColor.bgWhitePinkClr,
            moonColor: AppColor.bgWhitePinkClr,
            starsColor: AppColor.bgWhitePinkClr,
            cratersColor: AppColor.bgWhitePinkClr,

          )),
      IconButton(
          onPressed: () {},
          icon: CustomImageIcon(iconSearchImg, AppColor.backIconClr, 42)),
      IconButton(
          onPressed: () {},
          icon: CustomImageIcon(iconMoreImg, AppColor.backIconClr, 40)),
    ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.1),
      child: Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          unselectedLabelColor: AppColor.tabBarPinkClr,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            border: Border.all(
                color: AppColor.bgPurpleClr,
                strokeAlign: BorderSide.strokeAlignInside,
                style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                color: AppColor.bgPurpleClr,
                blurRadius: 9,
                // spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(57),
            gradient: LinearGradient(
              colors: [AppColor.tabBarPinkClr, AppColor.bgPurpleClr],
              stops: [0.2, 1.0],
              tileMode: TileMode.repeated,
            ),
          ),
          tabs: tabs,

// indicatorColor: AppColor.iconBlack,
        ),
      ),
    ),
  );
}
