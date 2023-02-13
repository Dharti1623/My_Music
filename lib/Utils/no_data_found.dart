import 'package:flutter/material.dart';
import '../UI/CustomWidgets/custom_container.dart';
import 'color_constants.dart';
import 'image_constants.dart';
import 'string_constants.dart';

// ignore: must_be_immutable
class NoDataFound extends StatefulWidget {
  const NoDataFound({Key? key,}) : super(key: key);
  @override
  State<NoDataFound> createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(child: customImageContainer(noAudioFoundImg,context,AppColor.transparentClr)),
            Center(child: customTextContainer(context,errorMessage)),
          ],
        ),

      ),
    );
  }
}
