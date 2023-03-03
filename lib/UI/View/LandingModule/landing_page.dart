import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Config/Services/network_manager.dart';
import '../../../Utils/common_style.dart';
import '../../../Utils/error_screen.dart';
import '../../../Utils/image_constants.dart';
import '../../../Utils/string_constants.dart';
import '../HomePageModule/View/home_page.dart';
import '../LoginModule/View/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();
  int splashTime = 3;
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  requestPermission() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(keyUserToken);
    // Web platform don't support permissions methods.
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        bool permissionStatus = await audioQueryEx.permissionsStatus();
        if (!permissionStatus) {
          await audioQueryEx.permissionsRequest();

          if (token != null) {
            Get.offAll(() => const SafeArea(child: HomePage()));
          } else {
            Get.offAll(() => GetBuilder<GetXNetworkManager>(
                builder: (builder) => networkManager.connectionType == 0
                    ? const SomethingWentWrong()
                    : const SafeArea(child: MyLogin())));
          }
        }
      }
      Future.delayed(Duration(seconds: splashTime), () async {
        if (token != null) {
          Get.offAll(() => const SafeArea(child: HomePage()));
        } else {
          Get.offAll(() =>
              GetBuilder<GetXNetworkManager>(
                  builder: (builder) =>
                  networkManager.connectionType == 0
                      ? const SomethingWentWrong()
                      : const SafeArea(child: MyLogin())
              ));
        }
      });
    }
    else{
      Future.delayed(Duration(seconds: splashTime), () async {
        if (token != null) {
          Get.offAll(() => const SafeArea(child: HomePage()));
        } else {
          Get.offAll(() =>
              GetBuilder<GetXNetworkManager>(
                  builder: (builder) =>
                  networkManager.connectionType == 0
                      ? const SomethingWentWrong()
                      : const SafeArea(child: MyLogin())
              ));
        }
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
                  const Center(child: Text(wayOfMusic,textAlign: TextAlign.center,style: wayOfMusicTxtStyle)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

