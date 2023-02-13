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

 ButtonStyle btnStyle =  ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: AppColor.transparentClr,padding: EdgeInsets.all(0),);
 ButtonStyle btnStyle1 =  ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: AppColor.transparentClr,elevation: 0,padding: EdgeInsets.all(0),);


  TextStyle tabBarTxtStyle = const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400,fontFamily: 'Pacifico',color: Color(0xFFFFFFFF));
  TextStyle bottomBarTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Ralway', color: AppColor.iconBlackClr);
  TextStyle bottomBarSubTitleTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Ralway', color: AppColor.iconBlackClr);
  TextStyle trackTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: 'Ralway', color: AppColor.iconBlackClr);
  TextStyle trackSubTitleTxtStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Ralway', color: AppColor.iconBlackClr);

  TextStyle wayOfMusicTxtStyle = TextStyle(fontSize: 30.0,fontFamily: 'Pacifico',color: Color(0xFF937DC2));