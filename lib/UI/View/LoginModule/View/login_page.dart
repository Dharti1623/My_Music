import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_music/Utils/color_constants.dart';

import '../../../../Config/Services/isar_service.dart';
import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/common_style.dart';
import '../../../../Utils/string_constants.dart';
import '../ViewModel/login_view_model.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final loginViewModel = Get.find<LoginViewModel>();
  final loginFormKey = GlobalKey<FormState>();
  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();
  RxBool loginPasswordVisible = false.obs;

  @override
  void initState() {
    emailTxtController.text = "";
    passwordTxtController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: landingScreenBgColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.35,left: 35,right: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: AppColor.bgBlackClr),
                        controller: emailTxtController,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (EmailCurrentValue) {
                          RegExp regex = RegExp(
                              r'^[_A-Za-z0-9-+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})\$*(\s?)');
                          var emailNonNullValue = EmailCurrentValue ?? "";
                          if (emailNonNullValue.isEmpty) {
                            return (errorMessageTxt);
                          } else if (!regex.hasMatch(emailNonNullValue)) {
                            return (emailNotCorrect);
                          }
                          return null;
                        },
                        enableSuggestions: false,
                        autocorrect: false,
                        cursorColor: Colors.grey.withOpacity(0.8),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          errorMaxLines: 1,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 100),
                        child: TextFormField(
                          autofocus: false,
                          style:TextStyle(color: AppColor.bgBlackClr),
                          controller: passwordTxtController,
                          obscureText: !loginPasswordVisible.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (PassCurrentValue) {
                            // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            var passNonNullValue = PassCurrentValue ?? "";
                            if (passNonNullValue.isEmpty) {
                              return (errorMessageTxt);
                            }else if (passNonNullValue.length < 8) {
                              return (passwordLengthCheck);
                            }/* else if (!regex.hasMatch(passNonNullValue)) {
                              return (passwordContain);
                            }*/
                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          cursorColor: Colors.grey.withOpacity(0.8),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            /*suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                loginPasswordVisible.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColor.backIconClr,
                                size: 21,
                              ),
                              onPressed: () {
                                print(loginPasswordVisible.value);
                                showLoginPassword();
                              },
                            ),*/
                            errorMaxLines: 2,
                            errorStyle: TextStyle(fontFamily: 'Roboto'),
                            labelStyle: const TextStyle(decoration: TextDecoration.none),
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                wordSpacing: 0.15,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              loginViewModel.getUserLogin(context, emailTxtController.text.trim(),
                                  passwordTxtController.text.trim(),);
                              loginViewModel.isLoading.value = true;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.bgPurpleDarkClr, // background (button) color
                            foregroundColor: AppColor.bgWhiteClr, // foreground (text) color
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Login',style:TextStyle(fontSize: 25),),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showLoginPassword(){
    loginPasswordVisible.value = !loginPasswordVisible.value;
  }
}