import 'package:ask/controllers/resetpassword/resetpasword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../constants/app_strings/app_strings.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
    return GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.rheading,
                      style: CommonTextStyle.style2,
                    ),
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color(0xff1e1e1e),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  CommonTextField(
                    controller: _.oldpassowrd,
                    hintText: "Old Password",
                    bordercolor: AppColors.textFieldBorderColor,
                    fillcolor: Colors.white,
                    radius: 7,
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  CommonTextField(
                    controller: _.newpassowrd,
                    hintText: "New Password",
                    bordercolor: AppColors.textFieldBorderColor,
                    fillcolor: Colors.white,
                    radius: 7,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CommonTextField(
                    controller: _.confirmpassowrd,
                    hintText: "Confirm Password",
                    bordercolor: AppColors.textFieldBorderColor,
                    fillcolor: Colors.white,
                    radius: 7,
                  ).marginOnly(top: 12),
                  const SizedBox(
                    height: 45.0,
                  ),
                  Center(
                    child: CommonButton(
                        text: "Update & Return",
                        textStyle: CommonTextStyle.style1,
                        onPressed: () {},
                        fillColor: AppColors.buttonColor),
                  ),
                ],
              ).marginOnly(left: 25, right: 25),
            ),
          );
        });
  }
}
