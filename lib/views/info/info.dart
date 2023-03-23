import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/info/info_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

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
      extendBodyBehindAppBar: true,
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<InfoController>(
      init: InfoController(),
      builder: (_) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.discoverBackgroundColor1,
                AppColors.discoverBackgroundColor2
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _.heading,
                    style: CommonTextStyle.style2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (c, i) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                    itemBuilder: (c, i) {
                      return userInfo();
                    },
                  ).marginOnly(bottom: 25.0, top: 10.0)
                ],
              ).marginOnly(left: 25, right: 25),
            ),
          ),
        );
      },
    );
  }

  Widget userInfo() {
    return Container(
      width: Get.width,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  AppAssets.avatar,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            'Harry',
            style: CommonTextStyle.infoText,
          ),
          const Spacer(),
          ViewProfileButton(
            onPressed: () {
              Get.toNamed(Routes.userprofile);
            },
            text: 'Visit Profile',
            fillColor: const Color(0xff85BAF8),
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ],
      ).marginOnly(left: 10.0, right: 10.0),
    );
  }
}
