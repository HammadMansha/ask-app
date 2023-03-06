import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/auth/signup/signup2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/common_buttons/common_button.dart';
import '../../../widgets/common_textfields/commn_textfield.dart';
import '../../../widgets/common_textstyle/common_text_style.dart';

class SignUpScreen2 extends StatelessWidget {
  const SignUpScreen2({Key? key}) : super(key: key);

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

    ),);
  }
  Widget bodyData(context){
    return GetBuilder<SignUp2Controller>(init: SignUp2Controller(),builder: (_) {
      return Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("${AppStrings.letsGet}",style: CommonTextStyle.style2,).marginOnly(top: 50,left: 50),
              Text("${AppStrings.signUp}",style: CommonTextStyle.style3,).marginOnly(top: 0,left: 50),
              CommonTextField(
                controller: _.firstName,
                hintText: "First Name",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 48,left: 50,right: 50),
              CommonTextField(
                controller: _.lastName,
                hintText: "Last Name",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 12,left: 50,right: 50),
              CommonTextField(
                controller: _.dateOfBirth,
                hintText: "Date of Birth(DD/MM/YY)",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 12,left: 50,right: 50),
              CommonTextField(
                controller: _.userName,
                hintText: "Username",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 12,left: 50,right: 50),
              CommonTextField(
                controller: _.password,
                hintText: "Password",
                bordercolor: AppColors.textFieldBorderColor,
                fillcolor: Colors.white,
                radius: 7,
              ).marginOnly(top: 12,left: 50,right: 50),




              Center(
                child: CommonButton(text: "Sign up", textStyle: CommonTextStyle.style1, onPressed: (){
                  Get.toNamed(Routes.login);
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
