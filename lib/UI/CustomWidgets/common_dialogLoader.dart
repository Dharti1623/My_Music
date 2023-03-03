import 'package:flutter/material.dart';
import '../../Utils/color_constants.dart';
import 'common_animatedLoader.dart';


animatedLoadingBox(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SizedBox(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: AppColor.bgPinkClr),
                  child: const Loader(),
                )
              ],
            ),
          ),
        );
      });
}
