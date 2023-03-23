import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/drawer_items/notificationsetting_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xff1E1E1E),
        ),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: bodyData(context),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<NotificationSettingController>(
      init: NotificationSettingController(),
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.nheading,
                  style: CommonTextStyle.style2,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 49,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          AppStrings.option1,
                          style: CommonTextStyle.notifcationstyleTextColor,
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 33.95,
                        height: 16.45,
                        toggleSize: 10.0,
                        value: _.option1,
                        borderRadius: 10.0,
                        padding: 2.0,
                        toggleColor: const Color(0xff85BAF8),
                        switchBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        toggleBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        activeColor: const Color(0xff85BAF8),
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          print("check value $val");
                          _.option1 = val;
                          _.update();
                        },
                      ),
                    ],
                  ).marginOnly(left: 10.0, right: 10.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 49,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          AppStrings.option2,
                          style: CommonTextStyle.notifcationstyleTextColor,
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 33.95,
                        height: 16.45,
                        toggleSize: 10.0,
                        value: _.option2,
                        borderRadius: 10.0,
                        padding: 2.0,
                        toggleColor: const Color(0xff85BAF8),
                        switchBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        toggleBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        activeColor: const Color(0xff85BAF8),
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          print("check value $val");
                          _.option2 = val;
                          _.update();
                        },
                      ),
                    ],
                  ).marginOnly(left: 10.0, right: 10.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 49,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          AppStrings.option3,
                          style: CommonTextStyle.notifcationstyleTextColor,
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 33.95,
                        height: 16.45,
                        toggleSize: 10.0,
                        value: _.option3,
                        borderRadius: 10.0,
                        padding: 2.0,
                        toggleColor: const Color(0xff85BAF8),
                        switchBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        toggleBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        activeColor: const Color(0xff85BAF8),
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          print("check value $val");
                          _.option3 = val;
                          _.update();
                        },
                      ),
                    ],
                  ).marginOnly(left: 10.0, right: 10.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 49,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          AppStrings.option4,
                          style: CommonTextStyle.notifcationstyleTextColor,
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 33.95,
                        height: 16.45,
                        toggleSize: 10.0,
                        value: _.option4,
                        borderRadius: 10.0,
                        padding: 2.0,
                        toggleColor: const Color(0xff85BAF8),
                        switchBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        toggleBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        activeColor: const Color(0xff85BAF8),
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          print("check value $val");
                          _.option4 = val;
                          _.update();
                        },
                      ),
                    ],
                  ).marginOnly(left: 10.0, right: 10.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 49,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          AppStrings.option5,
                          style: CommonTextStyle.notifcationstyleTextColor,
                        ),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        width: 33.95,
                        height: 16.45,
                        toggleSize: 10.0,
                        value: _.option5,
                        borderRadius: 10.0,
                        padding: 2.0,
                        toggleColor: const Color(0xff85BAF8),
                        switchBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        toggleBorder: Border.all(
                          color: const Color(0xff85BAF8),
                          width: 1.0,
                        ),
                        activeColor: const Color(0xff85BAF8),
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          print("check value $val");
                          _.option5 = val;
                          _.update();
                        },
                      ),
                    ],
                  ).marginOnly(left: 10.0, right: 10.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: CommonButton(
                    text: "Update & Return",
                    textStyle: CommonTextStyle.style1,
                    onPressed: () {
                      Get.offAllNamed(Routes.dashboard);
                    },
                    fillColor: AppColors.buttonColor,
                  ),
                )
              ],
            ).marginOnly(left: 25, right: 25),
          ),
        );
      },
    );
  }
}
