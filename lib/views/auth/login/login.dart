
import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/controllers/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyData(context),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ));
  }

  Widget bodyData(context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.welcomeBack,
                    style: CommonTextStyle.style2,
                  ).marginOnly(top: 50, left: 50),
                  Text(
                    AppStrings.username,
                    style: CommonTextStyle.style3,
                  ).marginOnly(top: 0, left: 50),
                  CommonTextField(
                    controller: _.email,
                    hintText: "Email",
                    bordercolor: AppColors.textFieldBorderColor,
                    fillcolor: Colors.white,
                    radius: 7,
                  ).marginOnly(top: 48, left: 50, right: 50),
                  CommonTextField(
                    controller: _.password,
                    hintText: "Password",
                    bordercolor: AppColors.textFieldBorderColor,
                    fillcolor: Colors.white,
                    radius: 7,
                  ).marginOnly(top: 12, left: 50, right: 50),
                  Center(
                    child: const Text("Remember Password")
                        .marginOnly(top: 36, bottom: 36),
                  ),
                  Center(
                    child: CommonButton(
                        text: "Log in",
                        textStyle: CommonTextStyle.style1,
                        onPressed: () {
                          Get.offAllNamed(Routes.dashboard);
                        },
                        fillColor: AppColors.buttonColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.forgotPassword);
                    },
                    child: Center(
                      child: const Text("Forgot Password?")
                          .marginOnly(top: 36, bottom: 36),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      AppAssets.colorfulAsk,
                      height: 30,
                      width: 30,
                    ),
                  ).marginOnly(top: 40),
                ],
              ),
            ),
          );
        });
  }
}
