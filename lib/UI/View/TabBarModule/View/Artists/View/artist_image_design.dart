import 'package:flutter/material.dart';
import '../../../../../../../../Utils/image_constants.dart';
import '../../common_image_design.dart';
import '../../common_square_border_design.dart';

class ArtistImageDesign extends StatelessWidget {
  const ArtistImageDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CommonSquareDesign(),
        CommonImageDesign(ellipse17,130,0,30),
        CommonImageDesign(ellipse19,132,50,0),
        CommonImageDesign(ellipse18,134,10,0),
      ],
    );
  }
}
