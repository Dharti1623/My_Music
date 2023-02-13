import 'package:flutter/material.dart';
import '../UI/CustomWidgets/custom_container.dart';
import 'color_constants.dart';
import 'image_constants.dart';
import 'string_constants.dart';

// ignore: must_be_immutable
class SomethingWentWrong extends StatefulWidget {
  const SomethingWentWrong({Key? key,}) : super(key: key);
  @override
  State<SomethingWentWrong> createState() => _SomethingWentWrongState();
}

class _SomethingWentWrongState extends State<SomethingWentWrong> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.internetImageClr,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(child: customImageContainer(noInternetImage,context,AppColor.internetImageClr)),
            Center(child: customTextContainer(context,pleaseTryAgain)),
          ],
        ),
      ),
    );
  }
}
