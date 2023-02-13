import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

import '../../Utils/common_style.dart';
import '../../Utils/image_constants.dart';
import 'play_control_icon.dart';

onBtnClick() {

}

Widget customBottomNavigationBar(BuildContext context) {
  return Container(
    height: 77,
    decoration: BoxDecoration(
        color: AppColor.bgWhiteClr, borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23))),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.bottomBarPurpleClr,
              AppColor.bottomBarPinkClr,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23))),
      margin: EdgeInsets.only(top: 1,),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 9, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(blurRadius: 8, /*spreadRadius: 4,*/
                          color: AppColor.iconBlackClr,
                          offset: Offset(2, 6))
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    child: ClipOval(
                      child: Image.asset(
                        placeHolderImg,
                        width: 56.0,
                        height: 56.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  // right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Song Title',
                        style: bottomBarTitleTxtStyle),
                    Text('Singer',
                        style: bottomBarSubTitleTxtStyle),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 22, bottom: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                playControlIcon(context, backwardArrowImg, () => {
                print("backwardArrow")
                }),
                playControlIcon(context, playArrowImg, () => {}),
                playControlIcon(context, forwardArrowImg, () => {}),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
