import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/auth/signup_or_login_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ask/routes/app_routes.dart';

import '../../widgets/common_textstyle/common_text_style.dart';

class SignupOrLogin extends StatelessWidget {
  const SignupOrLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyData(context),);
  }
  Widget bodyData(context){
    return GetBuilder<SignupOrLoginController>(init: SignupOrLoginController(),builder: (_) {
        return Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${AppStrings.welcomeTo}",style: CommonTextStyle.style2,),
              Image.asset(AppAssets.colorfulAsk).marginOnly(top: 32,bottom: 100),
              CommonButton2(text: "Sign up", textStyle: CommonTextStyle.style1, onPressed: (){

                Get.toNamed(Routes.signUp);
              }, fillColor: AppColors.buttonColor),
              CommonButton2(text: "Login", textStyle: CommonTextStyle.style1, onPressed: (){
                Get.toNamed(Routes.login);
              },
                  fillColor: AppColors.buttonColor).marginOnly(top: 12)


            ],
          ),
        );
      }
    );
  }



}
