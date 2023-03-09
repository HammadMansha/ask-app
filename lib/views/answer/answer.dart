import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/answer/answer_controller.dart';
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
                  // border: Border.all(
                  //     color: Colors.white
                  // ),
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
                children: [
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.services)
                            .marginOnly(bottom: 17, top: 32),
                        Text(
                          AppStrings.services,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.product)
                            .marginOnly(bottom: 17, top: 32),
                        Text(
                          AppStrings.product,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.technology)
                            .marginOnly(bottom: 17, top: 32),
                        Text(
                          AppStrings.technology,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.resturant)
                            .marginOnly(bottom: 17, top: 32),
                        Text(
                          AppStrings.restaurants,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.handshake)
                            .marginOnly(bottom: 17, top: 32),
                        Text(
                          AppStrings.buyAndSell,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
                  Container(
                    height: 140,
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
                      // border: Border.all(
                      //     color: Colors.white
                      // ),

                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.threeHorizontalDote)
                            .marginOnly(bottom: 17, top: 50),
                        Text(
                          AppStrings.others,
                          style: CommonTextStyle.style7font16weight700white,
                        )
                      ],
                    ),
                  ).marginOnly(left: 10),
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
}
