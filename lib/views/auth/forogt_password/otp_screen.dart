import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../constants/app_assets/app_assets.dart';
import '../../../controllers/auth/forgotpassword/otpscreen_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyData(context),
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

        )

    );
  }
  Widget bodyData(context){
    return GetBuilder<OTPScreenController>(init: OTPScreenController(),builder: (_) {
      return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: Get.width / 1.8,
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                    color: Colors.white, fontSize: 11),
                length: 4,
                animationType: AnimationType.fade,
                textStyle: TextStyle(
                    letterSpacing: 0.4,
                    color: Colors.white,
                    fontSize: 11),
                // ignore: body_might_complete_normally_nullable
                validator: (v) {
                  // if (v!.length < 3) {
                  //   return "I'm from validator";
                  // } else {
                  //   return null;
                  // }
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
                  inactiveColor:
                  AppColors.whiteColor,
                  inactiveFillColor:
                  Colors.white,
                  activeColor:
                  AppColors.textFieldBorderColor,
                  activeFillColor:
                  AppColors.textFieldBorderColor,
                ),
                cursorColor: Colors.black,
                animationDuration:
                const Duration(milliseconds: 300),
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
                onCompleted: (v) {

                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
              ),
            ).marginOnly(bottom: 50),





            CommonButton(text: "Submit", textStyle: CommonTextStyle.style1, onPressed: (){}, fillColor: AppColors.buttonColor),
            GestureDetector(
              onTap:(){
              },
              child: Center(
                child: Text("Resend OTP").marginOnly(top: 68,bottom: 36),


              ),
            ),
            //Center(child: Image.asset("${AppAssets.colorfulAsk}",height: 30,width: 30,),).marginOnly(top:100),

          ],
        ),
      );
    }
    );
  }

}
