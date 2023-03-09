import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/auth/signup/signup_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ask/routes/app_routes.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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

    ),

    );
  }
  Widget bodyData(context){
    return GetBuilder<SignUpController>(init: SignUpController(),builder: (_) {
      return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(AppStrings.letsGet,style: CommonTextStyle.style2,).marginOnly(top: 50,left: 50),
              Text(AppStrings.signUp,style: CommonTextStyle.style3,).marginOnly(top: 0,left: 50),
              CommonTextField(
                  controller: _.email,
                hintText: "Email",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 48,left: 50,right: 50),
              Center(
                child: CommonButton(text: "Continue", textStyle: CommonTextStyle.style1, onPressed: (){
                  Get.toNamed(Routes.signUpScreen2);
                }, fillColor: AppColors.buttonColor),
              ).marginOnly(top: 36),


            ],
          ),
        ),
      );
    }
    );
  }

}
