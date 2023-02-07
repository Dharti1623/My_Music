import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'Network/NetworkHandler/network_binding.dart';
import 'UI/View/LandingModule/landing_page.dart';
import 'Utils/common_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Music',
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),
      theme: ThemeData.light(),
      // fallbackLocale: const Locale('en', 'US'),
      // home: HomePage(),
      home: Container(decoration: screenBgColor,child: SafeArea(child: LandingPage())),
    );
  }
}

