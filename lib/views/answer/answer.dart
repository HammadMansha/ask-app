import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/answer/answer_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<AnswerController>(
      init: AnswerController(),
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.search,
                style: CommonTextStyle.style2,
              ),
              SizedBox(
                height: 44,
                child: CommonTextField(
                  controller: _.searchController,
                  radius: 25.0,
                  suffixicon: const Icon(Icons.search),
                  bordercolor: AppColors.textFieldBorderColor,
                  hintText: "Search Questions/ Users",
                  fillcolor: AppColors.whiteColor,
                ),
              ).marginOnly(top: 45),
              Container(
                height: 35,
                width: 174,
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(55),
                ),
                child: Row(
                  children: [
                    Text(
                      AppStrings.location,
                      style: CommonTextStyle.style1,
                    ).marginOnly(left: 18),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 18,
                    ).marginOnly(right: 16)
                  ],
                ),
              ).marginOnly(top: 36, bottom: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  category(
                    imageName: AppAssets.services,
                    heading: AppStrings.services,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  category(
                    imageName: AppAssets.product,
                    heading: AppStrings.product,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  category(
                    imageName: AppAssets.technology,
                    heading: AppStrings.technology,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  category(
                    imageName: AppAssets.resturant,
                    heading: AppStrings.restaurants,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  category(
                    imageName: AppAssets.handshake,
                    heading: AppStrings.buyAndSell,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  category(
                    imageName: AppAssets.threeHorizontalDote,
                    heading: AppStrings.others,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ).marginOnly(left: 25, right: 25),
        );
      },
    );
  }

  Widget category({String? imageName, String? heading}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.searchCategory, arguments: heading);
      },
      child: Container(
        height: 160,
        width: Get.width / 2.6,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.discoverBackgroundColor2,
              AppColors.discoverBackgroundColor1
            ],
          ),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          children: [
            Image.asset(
              imageName!,
              height: 50,
              width: 50,
            ).marginOnly(bottom: 10, top: 50),
            Text(
              heading!,
              style: CommonTextStyle.style7font16weight700white,
            )
          ],
        ),
      ),
    );
  }
}
