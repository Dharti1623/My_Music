import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/Services/network_manager.dart';
import '../../../Utils/common_function.dart';
import '../../../Utils/common_style.dart';
import '../../../Utils/error_screen.dart';
import '../../../Utils/image_constants.dart';
import '../../../Utils/string_constants.dart';
import '../HomePageModule/View/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  requestPermission() async {
    // Web platform don't support permissions methods.
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        bool permissionStatus = await audioQueryEx.permissionsStatus();
        if (!permissionStatus) {
          await audioQueryEx.permissionsRequest();
          Get.offAll(() => GetBuilder<GetXNetworkManager>(
              builder: (builder) => networkManager.connectionType == 0
                  ? SomethingWentWrong()
                  : SafeArea(child: HomePage())));
        }
        // else{
        //
        // }
      }
        Future.delayed(Duration(seconds: 3), () async {
          Get.offAll(() => GetBuilder<GetXNetworkManager>(
              builder: (builder) => networkManager.connectionType == 0
                  ? SomethingWentWrong()
                  : SafeArea(child: HomePage())));
        });
    }
    else{
      Future.delayed(Duration(seconds: 3), () async {
        Get.offAll(() => GetBuilder<GetXNetworkManager>(
            builder: (builder) => networkManager.connectionType == 0
                ? SomethingWentWrong()
                : SafeArea(child: HomePage())));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:landingScreenBgColor,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  headPhoneImg,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset(volumeEffectImg)),
                  Center(
                    child: Text(wayOfMusic,textAlign: TextAlign.center,style: wayOfMusicTxtStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
