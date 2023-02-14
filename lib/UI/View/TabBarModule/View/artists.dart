import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';
import '../../../../Utils/common_style.dart';
import '../../../../Utils/image_constants.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_icon.dart';
import 'Tracks/View/track_divider.dart';
import 'Tracks/View/track_title.dart';

// ignore: must_be_immutable
class Artists extends StatelessWidget {
  Artists({Key? key}) : super(key: key);
  List<bool> chkFav = List.filled(10, false, growable: false).obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SafeArea(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chkFav.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => InkWell(
                onTap: () {
                  print('---->>ontap-->${chkFav[index]}--->$index--->');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 27, right: 15, bottom: 6),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      tracksCircleAvtar(placeHolderImg),
                                      TracksTitle(songTitleTxt,singerTxt),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          chkFav[index] = !chkFav[index];
                                        },
                                        child: chkFav[index]
                                            ? CustomIcon(Icons.favorite,
                                            AppColor.bgHeartClr, 32)
                                            : CustomIcon(Icons.favorite,
                                            AppColor.bgWhiteClr, 32)),
                                    IconButton(
                                      onPressed: () {},
                                      icon: CustomIcon(Icons.more_vert_sharp,AppColor.bgBlackClr,32),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            tracksDivider(2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            }),
      ),
    );
  }
}





Widget tracksCircleAvtar(avtarImg) {
  return Padding(
    padding: EdgeInsets.only(bottom: 9, right: 16),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 5, color: AppColor.shadowBlackClr, offset: Offset(3, 5))
        ],
      ),
      child: CircleAvatar(
        radius: 47,
        child: ClipOval(
          child: Image.asset(
            avtarImg,
            width: 94.0,
            height: 94.0,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}

/*Widget tracksTitle(songTitleName,singerName){
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(
        top: 23,
        bottom: 32,
        // right: 10,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(songTitleName,
              style: trackTitleTxtStyle,maxLines: 1,),
          Text(singerName,
              style: trackSubTitleTxtStyle),
        ],
      ),
    ),
  );
}

Widget tracksDivider(double lineThickNess) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: AppColor.bgWhite,
        thickness: lineThickNess,
      ));
}*/
