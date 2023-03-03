import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Config/Services/isar_service.dart';
import '../../../../Network/Repository/login_repository.dart';
class LoginViewModel extends FullLifeCycleController {

  var tokenText = [].obs;
  var isLoading = false.obs;
  var onError = false.obs;
  final service = IsarService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUserLogin(BuildContext context, String email, String password) async {
    var tokenValue = await LoginRepository().userLogin(context, email,password,service);
    if (tokenValue.token != null) {
      isLoading.value = false;
      tokenText.value = tokenText;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}