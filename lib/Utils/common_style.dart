import 'package:flutter/material.dart';
import 'color_constants.dart';

BoxDecoration screenBgColor = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    AppColor.bgPinkClr,
    AppColor.bgWhitePinkClr,
    AppColor.bgPurpleClr,
  ],
  // stops: const [0,0.3893,1.0]
));

BoxDecoration landingScreenBgColor = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    AppColor.tabBarPinkClr,
    AppColor.bgWhitePinkClr,
  ],
));

BoxDecoration playScreenBgColor = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    AppColor.bgPurpleClr,
    AppColor.bgPlayPinkClr,
  ],
));

ButtonStyle btnStyle = ElevatedButton.styleFrom(
  shape: CircleBorder(),
  backgroundColor: AppColor.transparentClr,
  padding: EdgeInsets.all(0),
);
ButtonStyle btnStyle1 = ElevatedButton.styleFrom(
  shape: CircleBorder(),
  backgroundColor: AppColor.transparentClr,
  elevation: 0,
  padding: EdgeInsets.all(0),
);

const TextStyle tabBarTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: 'Pacifico', color: AppColor.bgWhiteClr);
const TextStyle bottomBarTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
const TextStyle bottomBarSubTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
const TextStyle trackTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
const TextStyle trackSubTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Raleway', color: AppColor.bgBlackClr);

const TextStyle playSongTitleTxtStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: 'Pacifico', color: AppColor.bgBlackClr);
const TextStyle playSongSingerTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
const TextStyle playSongFavTxtStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, fontFamily: 'Raleway', color: AppColor.bgBlackClr);

const TextStyle wayOfMusicTxtStyle = TextStyle(fontSize: 30.0, fontFamily: 'Pacifico', color: AppColor.bgPurpleClr);

const TextStyle albumTitleTxtStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
const TextStyle albumTrackTxtStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Raleway', color: AppColor.bgBlackClr);
