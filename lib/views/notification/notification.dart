import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/notifications/notifications_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings/app_strings.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.turnOn,
                  style: CommonTextStyle.style2,
                ).marginOnly(top: 50),
                Text(
                  AppStrings.notifcations,
                  style: CommonTextStyle.style3,
                ).marginOnly(top: 0),
                Image.asset(
                  AppAssets.notification,
                  height: 41,
                  width: 41,
                ).marginOnly(top: 22),
                SizedBox(
                  width: 196,
                  child: CommonButton2(
                    text: "Yes,Notify me",
                    textStyle: CommonTextStyle.style1,
                    onPressed: () {
                      Get.offAllNamed(Routes.dashboard);
                    },
                    fillColor: AppColors.buttonColor,
                  ),
                ).marginOnly(top: 38),
                CommonButton3(
                  text: "Not now",
                  textStyle: CommonTextStyle.style4,
                  onPressed: () {
                    Get.offAllNamed(Routes.dashboard);
                  },
                  fillColor: AppColors.whiteColor,
                ).marginOnly(top: 19)
              ],
            ).marginOnly(left: 25, right: 25),
          ),
        );
      },
    );
  }
}
