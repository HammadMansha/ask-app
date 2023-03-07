import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/notifications/notifications_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyData(context),
      backgroundColor: Colors.white,

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
  Widget bodyData(context){
    return GetBuilder<NotificationController>(init: NotificationController(),builder: (_){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${AppStrings.turnOn}",style: CommonTextStyle.style2,).marginOnly(top: 50),
            Text("${AppStrings.notifcations}",style: CommonTextStyle.style3,).marginOnly(top: 0),
            Image.asset("${AppAssets.notification}").marginOnly(top: 22),
            SizedBox(width:196,child: CommonButton2(text: "Yes,Notify me", textStyle: CommonTextStyle.style1, onPressed: (){
              Get.toNamed(Routes.discover);

            }, fillColor: AppColors.buttonColor)).marginOnly(top:
            38),
            CommonButton3(text: "Not now", textStyle: CommonTextStyle.style4, onPressed: (){
              Get.toNamed(Routes.discover);
            }, fillColor: AppColors.whiteColor).marginOnly(top: 19)

          ],
        ).marginOnly(left: 50),

      );
    });
  }

}
