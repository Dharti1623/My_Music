import 'package:flutter/material.dart';
import 'package:my_music/Utils/color_constants.dart';

import '../../Utils/image_constants.dart';

customAppBar(BuildContext context, tabs, addVisibility,TabController tabController) {
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(18),
      ),
    ),
    backgroundColor: AppColor.bgPink,
    title: Padding(
      padding: const EdgeInsets.only(top: 50,bottom: 43),
      child: Image.asset(
        appBarImg
      ),
    ),
    actions: [
      Visibility(
        visible: addVisibility,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_outlined,
              color: AppColor.iconBlack,
              size: 42,
            )),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: AppColor.iconBlack,
            size: 42,
          )),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppColor.iconBlack,
            size: 42,
          )),
    ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.1),
      child: Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          unselectedLabelColor: AppColor.tabBarPink,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            border: Border.all(color: AppColor.bgPurple,strokeAlign: BorderSide.strokeAlignInside,style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                color:AppColor.bgPurple,
                blurRadius:9,
                // spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(57),
            gradient: LinearGradient(
              colors: [AppColor.tabBarPink, AppColor.bgPurple],
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
