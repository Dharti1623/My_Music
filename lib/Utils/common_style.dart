 import 'package:flutter/material.dart';
import 'color_constants.dart';

  BoxDecoration screenBgColor = BoxDecoration(
     gradient: LinearGradient(
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
       colors: [
         AppColor.bgPink,
         AppColor.bgWhitePink,
         AppColor.bgPurple,
       ],
       stops: [0,0.3893,1.0]
     ));


  TextStyle tabBarTxtStyle = TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400,fontFamily: 'Pacifico',color: Color(0xFFFFFFFF));
  TextStyle bottomBarTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Ralway', color: AppColor.iconBlack);
  TextStyle bottomBarSubTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Ralway', color: AppColor.iconBlack);
  TextStyle trackTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: 'Ralway', color: AppColor.iconBlack);
  TextStyle trackSubTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Ralway', color: AppColor.iconBlack);