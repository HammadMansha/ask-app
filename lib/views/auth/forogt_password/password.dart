import 'package:ask/controllers/auth/forgotpassword/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_assets/app_assets.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

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
      ),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<PasswordController>(
        init: PasswordController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: _.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgetPassword,
                      style: CommonTextStyle.style2,
                    ).marginOnly(top: 50, left: 50),
                    CommonTextField(
                      controller: _.password,
                      hintText: "new password",
                      bordercolor: AppColors.textFieldBorderColor,
                      fillcolor: Colors.white,
                      radius: 7,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ).marginOnly(top: 48, left: 50, right: 50),
                    CommonTextField(
                      controller: _.confirmpassword,
                      hintText: "confirm password",
                      bordercolor: AppColors.textFieldBorderColor,
                      fillcolor: Colors.white,
                      radius: 7,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (_.password.text == value) {
                          return 'password does not match';
                        }
                        return null;
                      },
                    ).marginOnly(top: 20, left: 50, right: 50),
                    Center(
                      child: CommonButton(
                          text: "Submit",
                          textStyle: CommonTextStyle.style1,
                          onPressed: () {
                            _.passwordFun();
                            // Get.back();
                            // Get.back();
                            // Get.back();
                          },
                          fillColor: AppColors.buttonColor),
                    ).marginOnly(top: 30),
                    Center(
                      child: Image.asset(
                        AppAssets.colorfulAsk,
                        height: 30,
                        width: 30,
                      ),
                    ).marginOnly(top: Get.height / 3),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
