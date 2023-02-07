import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'orderable_list_view.dart';

class ReOrderAbleListViewDemo extends StatefulWidget {
  const ReOrderAbleListViewDemo({Key? key}) : super(key: key);

  @override
  State<ReOrderAbleListViewDemo> createState() =>
      _ReOrderAbleListViewDemoState();
}

class _ReOrderAbleListViewDemoState extends State<ReOrderAbleListViewDemo> {
  bool isDarkModeEnable = false;

  void onStateChanged(bool isDarkModeEnable) {
    setState(() {
      if (isDarkModeEnable == true) {
        this.isDarkModeEnable = isDarkModeEnable;
        Get.changeTheme(ThemeData.dark());
      } else {
        this.isDarkModeEnable = isDarkModeEnable;
        Get.changeTheme(ThemeData.light());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ReorderableListView'),
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnable,
              onStateChanged: onStateChanged,
            ),
          ],
        ),
        body: Container(child: CustomReorderableList()),
      ),
    );
  }
}
