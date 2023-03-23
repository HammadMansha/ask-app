import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/discover/discover_controller.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<DiscoverScreenController>(
        init: DiscoverScreenController(),
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppStrings.discover,
                          style: CommonTextStyle.style2,
                        ),
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
                                        ? const LinearGradient(
                                            begin: Alignment.center,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff85BAF8),
                                              Color(0xff8BDAA2)
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
                                    AppStrings.public,
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
                                        ? const LinearGradient(
                                            begin: Alignment.center,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff85BAF8),
                                              Color(0xff8BDAA2)
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
                                      AppStrings.follower,
                                      style: _.tapFunction == 1
                                          ? CommonTextStyle.style1
                                          : CommonTextStyle.style4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).marginOnly(bottom: 2, top: 2),
                        ).marginOnly(top: 26),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      postContainer(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      postContainer(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      postContainer(),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).marginOnly(left: 25, right: 25);
        });
  }

  Widget postContainer() {
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
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.userprofile);
                },
                child: Image.asset(
                  AppAssets.profilePic,
                ).marginOnly(left: 22, top: 14),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.userprofile);
                },
                child: Center(
                  child: Text(
                    AppStrings.discoverUsername,
                    style: CommonTextStyle.style6font10weight400black,
                  ).marginOnly(top: 15, left: 9),
                ),
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
          Container(
            height: 150,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.postImage,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Image.asset(
                AppAssets.heartLike,
                height: 16,
                width: 17.93,
              ),
              Text(
                "1.1k",
                style: CommonTextStyle.style4,
              ).marginOnly(left: 8, right: 14),
              Image.asset(
                AppAssets.comment,
                height: 16,
                width: 16.89,
              ),
              Text(
                "1.1k",
                style: CommonTextStyle.style4,
              ).marginOnly(left: 8, right: 15),
              Image.asset(
                AppAssets.bookmark,
                height: 16,
                width: 12,
              ),
              Image.asset(
                AppAssets.share,
                width: 12.08,
                height: 13.38,
              ).marginOnly(left: 27),
              const Spacer(),
              Image.asset(AppAssets.dots).marginOnly(right: 19),
            ],
          ).marginOnly(left: 22),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
