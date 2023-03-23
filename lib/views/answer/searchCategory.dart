import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/answer/searchCategory_controller.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SearchCategoryScreen extends StatelessWidget {
  const SearchCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xff1E1E1E),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profileScreen);
            },
            child: Image.asset(AppAssets.profilePic),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff8BDAA2).withOpacity(0.27),
              const Color(0xff85BAF8).withOpacity(0.68)
            ],
          ),
        ),
        child: SafeArea(
          child: bodyData(context),
        ),
      ),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<SearchCategoryController>(
        init: SearchCategoryController(),
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 26,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _.heading,
                          style: CommonTextStyle.style2,
                        ),
                      ),
                      const SizedBox(
                        height: 36.0,
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
