import 'package:flutter/material.dart';


playControlIcon(BuildContext context,iconImage,GestureTapCallback onClick) {
  return InkWell(
    onTap: () {
      onClick;
    },
    child: SizedBox(
        child: Image.asset(
          iconImage,
          height: 36,
          width: 45,
        )),
  );
}