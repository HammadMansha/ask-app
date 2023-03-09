import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/drawer_items/helpcenter_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

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
    return GetBuilder<HelpCenterController>(
      init: HelpCenterController(),
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.hheading,
                  style: CommonTextStyle.style2,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                CommonTextField(
                  controller: _.help,
                  hintText: "Type your Complaint here",
                  bordercolor: AppColors.textFieldBorderColor,
                  fillcolor: Colors.white,
                  maxlines: 23,
                  radius: 7,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: CommonButton(
                    text: "Submit Complaint",
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
