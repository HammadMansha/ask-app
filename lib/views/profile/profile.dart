import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/profile/profile_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
    return GetBuilder<ProfileController>(
      init: ProfileController(),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width,
                height: 350,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      width: Get.width,
                      height: 285,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://burst.shopifycdn.com/photos/landscape-of-green-rolling-hills-and-mountain-peaks.jpg?width=1850&format=pjpg&exif=1&iptc=1'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                              AppAssets.avatar,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Theo Stone',
                        style: CommonTextStyle.profileTextColor,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '@theo123',
                        style: CommonTextStyle.profileUsername,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profileInfo(
                            heading: 'Posts',
                            count: '65',
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.infoScreen,
                                  arguments: 'Followers');
                            },
                            child: profileInfo(
                              heading: 'Followers',
                              count: '450',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.infoScreen,
                                  arguments: 'Following');
                            },
                            child: profileInfo(
                              heading: 'Following',
                              count: '12.3k',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bio',
                          style: CommonTextStyle.profileinfo,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'I am a person who enjoys staying connected with friends and family through social media. I love sharing moments from my daily life, learning about different cultures, and staying up to date with current events. I believe in the power of positivity and love spreading kindness and inspiration to those I interact with online.',
                          style: CommonTextStyle.profileBio,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
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
                                    'Questions',
                                    style: _.tapFunction == 1
                                        ? CommonTextStyle.style4
                                        : CommonTextStyle.style1,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _.tapFunction = 2;
                                _.update();
                              },
                              child: Container(
                                width: Get.width / 3.7,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: _.tapFunction == 2
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
                                    'Answer',
                                    style: _.tapFunction == 2
                                        ? CommonTextStyle.style1
                                        : CommonTextStyle.style4,
                                  ),
                                ),
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
                                    'Saved',
                                    style: _.tapFunction == 1
                                        ? CommonTextStyle.style1
                                        : CommonTextStyle.style4,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).marginOnly(bottom: 2, top: 2),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      postContainer(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      postContainer(),
                    ],
                  ),
                ).marginOnly(left: 25.0, right: 25.0, bottom: 35.0, top: 10.0),
              )
            ],
          ),
        );
      },
    );
  }

  Widget profileInfo({String? heading, String? count}) {
    return SizedBox(
      height: 40,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading!,
            style: CommonTextStyle.profileinfo,
          ),
          const Spacer(),
          Text(
            count!,
            style: CommonTextStyle.profileSubinfo,
          ),
        ],
      ),
    );
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
              Image.asset(AppAssets.heartLike),
              Text(
                "1.1k",
                style: CommonTextStyle.style4,
              ).marginOnly(left: 8, right: 14),
              Image.asset(AppAssets.comment),
              Text(
                "1.1k",
                style: CommonTextStyle.style4,
              ).marginOnly(left: 8, right: 15),
              Image.asset(AppAssets.bookmark),
              Image.asset(AppAssets.share).marginOnly(left: 27),
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
