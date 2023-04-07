import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controllers/auth/forgotpassword/otpscreen_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyData(context),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              // _.betterPlayerController.dispose();
              Get.back();
              // Get.off(() => Dashboard());
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
    return GetBuilder<OTPScreenController>(
        init: OTPScreenController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _.formKey,
                  child: SizedBox(
                    width: Get.width / 1.8,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                      ),
                      length: 4,
                      animationType: AnimationType.fade,
                      textStyle: const TextStyle(
                        letterSpacing: 0.4,
                        color: Colors.black,
                        fontSize: 11,
                      ),
                      validator: (v) {
                        if (v.toString() != _.otp.text) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        selectedFillColor: AppColors.textFieldBorderColor,
                        selectedColor: AppColors.textFieldBorderColor,
                        borderWidth: 2,
                        disabledColor: AppColors.textFieldBorderColor,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(4),
                        fieldHeight: 46,
                        fieldWidth: 46,
                        inactiveColor: AppColors.whiteColor,
                        inactiveFillColor: Colors.white,
                        activeColor: AppColors.textFieldBorderColor,
                        activeFillColor: AppColors.textFieldBorderColor,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      //errorAnimationController: _.errorController,
                      controller: _.pin,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ).marginOnly(bottom: 50),
                ),

                CommonButton(
                    text: "Submit",
                    textStyle: CommonTextStyle.style1,
                    onPressed: () {},
                    fillColor: AppColors.buttonColor),
                GestureDetector(
                  onTap: () {
                    if (_.formKey.currentState!.validate()) {
                      Get.toNamed(Routes.passwordScreen);
                    }
                    // Get.toNamed(Routes.passwordScreen);
                  },
                  child: Center(
                    child: const Text("Resend OTP")
                        .marginOnly(top: 68, bottom: 36),
                  ),
                ),
                //Center(child: Image.asset("${AppAssets.colorfulAsk}",height: 30,width: 30,),).marginOnly(top:100),
              ],
            ),
          );
        });
  }
}
