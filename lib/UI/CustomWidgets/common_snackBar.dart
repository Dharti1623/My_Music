import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Utils/color_constants.dart';

SnackbarController customSnackbar(String message){
  return Get.rawSnackbar(
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColor.bgPinkClr,
    snackStyle: SnackStyle.FLOATING,
    messageText: Text(message,style: TextStyle(color: AppColor.bgBlackClr,fontFamily: 'Roboto'),),
  );
}