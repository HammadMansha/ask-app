import 'package:ask/controllers/inbox/inbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<InboxScreenController>(
      init: InboxScreenController(),
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.inbox,
              style: CommonTextStyle.style2,
            ),
            Center(
                child: Container(
              width: Get.width / 1.7,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _.tapFunction = 0;
                      _.update();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: _.tapFunction == 0
                            ? LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.indigoAccent.shade100,
                                  Colors.green.shade100
                                ],
                              )
                            : const LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                      ),
                      width: Get.width / 3.7,
                      height: 40,
                      child: Center(
                          child: Text(
                        AppStrings.inbox,
                        style: _.tapFunction == 1
                            ? CommonTextStyle.style4
                            : CommonTextStyle.style1,
                      )),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _.tapFunction = 1;
                      _.update();
                    },
                    child: Container(
                      width: Get.width / 3.7,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: _.tapFunction == 1
                            ? LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.indigoAccent.shade100,
                                  Colors.green.shade100
                                ],
                              )
                            : const LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.received,
                          style: _.tapFunction == 1
                              ? CommonTextStyle.style1
                              : CommonTextStyle.style4,
                        ),
                      ),
                    ),
                  ),
                ],
              ).marginOnly(bottom: 2, top: 2),
            ).marginOnly(top: 26)),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10.0,
                ),
                itemBuilder: (c, i) {
                  return i == 1 ? cardWithImage() : askQuestionCard();
                },
              ).marginOnly(top: 10.0, bottom: 10.0),
            )
          ],
        ).marginOnly(left: 25, right: 25);
      },
    );
  }

  Widget askQuestionCard() {
    return Container(
      height: 170,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.0),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppAssets.profilePic).marginOnly(left: 22, top: 14),
              Center(
                child: Text(
                  AppStrings.discoverUsername,
                  style: CommonTextStyle.style6font10weight400black,
                ).marginOnly(top: 15, left: 9),
              ),
              Text(
                AppStrings.discoverPostTime,
                style: CommonTextStyle.style6font10weight400,
              ).marginOnly(top: 12, left: 9),
              const Spacer(),
              const Icon(
                Icons.location_on,
                color: AppColors.buttonColor,
                size: 12,
              ).marginOnly(top: 15),
              Text(
                AppStrings.discoverPostTLocation,
                style: CommonTextStyle.style6font10weight400,
              ).marginOnly(top: 15, left: 3, right: 15),
            ],
          ),
          Text(
            AppStrings.public,
            style: CommonTextStyle.style6font10weight400,
          ).marginOnly(top: 5, left: 25, right: 15),
          Text(
            AppStrings.discoverPostContent,
            style: CommonTextStyle.style5font14weight500,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(top: 5, left: 25, right: 15),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
                border: Border.all(color: AppColors.textFieldBorderColor),
              ),
              child: Center(
                  child: Text(
                AppStrings.answerQuestion,
                style: CommonTextStyle.style1,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardWithImage() {
    return Container(
      height: 310,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.0),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppAssets.profilePic).marginOnly(left: 22, top: 14),
              Center(
                child: Text(
                  AppStrings.discoverUsername,
                  style: CommonTextStyle.style6font10weight400black,
                ).marginOnly(top: 15, left: 9),
              ),
              Text(
                AppStrings.discoverPostTime,
                style: CommonTextStyle.style6font10weight400,
              ).marginOnly(top: 12, left: 9),
              const Spacer(),
              const Icon(
                Icons.location_on,
                color: AppColors.buttonColor,
                size: 12,
              ).marginOnly(top: 15),
              Text(
                AppStrings.discoverPostTLocation,
                style: CommonTextStyle.style6font10weight400,
              ).marginOnly(top: 15, left: 3, right: 15),
            ],
          ),
          Text(
            AppStrings.public,
            style: CommonTextStyle.style6font10weight400,
          ).marginOnly(top: 5, left: 25, right: 15),
          Text(
            AppStrings.discoverPostContent,
            style: CommonTextStyle.style5font14weight500,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ).marginOnly(top: 5, left: 25, right: 15),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 140,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.postImage,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
                border: Border.all(color: AppColors.textFieldBorderColor),
              ),
              child: Center(
                  child: Text(
                AppStrings.answerQuestion,
                style: CommonTextStyle.style1,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
