import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_music/Config/Services/isar_service.dart';
import 'package:my_music/Data/Localization/Entities/login_Entity.dart';
import 'package:my_music/Utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Remote/Request/Login Request/login_request.dart';
import '../../Data/Remote/Response/Login Response/login_response.dart';
import '../../UI/CustomWidgets/common_dialogLoader.dart';
import '../../UI/CustomWidgets/common_snackBar.dart';
import '../../UI/View/HomePageModule/View/home_page.dart';
import '../APIs/http_constant.dart';
import '../NetworkHandler/custom_dio.dart';

class LoginRepository {
  var customDio = CustomDio();
  var dio;

  Future<LoginModelResponse> userLogin(BuildContext context, String email, String password, IsarService service) async {
    animatedLoadingBox(context);
    try {
      final prefs = await SharedPreferences.getInstance();
      LoginRequest loginRequest = LoginRequest(email: email.trim(), password: password.trim());
      dio = await customDio.getDio();
      final response = await dio.post(loginUser, data: loginRequest.toJson());
      var loginResponseEntity = LoginModelResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        service.insertCategory(
          LoginEntities()
          ..userEmail = email.trim()
          ..userToken = (loginResponseEntity.token!),
        );
        prefs.setString(keyUserToken, loginResponseEntity.token!);
        prefs.setString(keyUserEmail,email.trim());

          Get.offAll(() => const HomePage());
          customSnackbar(loginResponseEntity.error.toString());
      } else {
        customSnackbar(loginResponseEntity.error.toString());
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
      return loginResponseEntity;
    } catch (error, stacktrace) {
      if (error is DioError) {
        if (error.response != null) {
          print("Exception occurred: ${error.response}");
          customSnackbar("${error.response!.data['error']}");
          Navigator.pop(context);
          return LoginModelResponse.withError(error.response!.data['error']);
        }
      }
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return LoginModelResponse.withError('Connection Issue !');
    }
  }
}

