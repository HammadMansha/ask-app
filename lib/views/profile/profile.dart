import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/profile/profile_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/circleImage.dart';
import '../../utils/commonContainer.dart';
import '../../utils/isLoading.dart';
import '../../utils/snackbar.dart';
import '../../widgets/common_buttons/common_button.dart';
import '../../widgets/common_textfields/commn_textfield.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: _.isLoading
              ? const Loading()
              : _.userProfile!.user == null
                  ? const Center(
                      child: Text(
                        'Profile not found',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 350,
                                  child: Stack(
                                    alignment: AlignmentDirectional.topCenter,
                                    children: [
                                      SizedBox(
                                        width: Get.width,
                                        height: 285,
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: _.userProfile!.user!
                                                          .coverImage ==
                                                      null
                                                  ? 'https://burst.shopifycdn.com/photos/landscape-of-green-rolling-hills-and-mountain-peaks.jpg?width=1850&format=pjpg&exif=1&iptc=1'
                                                  : _.userProfile!.user!
                                                      .coverImage!,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                AppAssets.colorfulAsk,
                                                fit: BoxFit.cover,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                AppAssets.colorfulAsk,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                icon: const Icon(
                                                    Icons.arrow_back_ios),
                                                color: const Color(0xff1E1E1E),
                                              ),
                                            ).marginOnly(top: 63.0, left: 5.0)
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CircularCachedNetworkImage(
                                          imageURL: _.userProfile!.user!
                                                      .photoPath ==
                                                  null
                                              ? AppAssets.avatar
                                              : _.userProfile!.user!.photoPath!,
                                          height: 145,
                                          width: 145,
                                          borderColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${_.userProfile!.user!.firstName} ${_.userProfile!.user!.lastName}',
                                      style: CommonTextStyle.profileTextColor,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '@${_.userProfile!.user!.userName}',
                                      style: CommonTextStyle.profileUsername,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        profileInfo(
                                          heading: 'Posts',
                                          count: '65',
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.infoScreen,
                                              arguments: {
                                                'heading': 'Followers',
                                                'id': _.userProfile!.user!.id
                                              },
                                            );
                                          },
                                          child: profileInfo(
                                            heading: 'Followers',
                                            count:
                                                '${_.userProfile!.followers!.length}',
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.infoScreen,
                                              arguments: {
                                                'heading': 'Following',
                                                'id': _.userProfile!.user!.id
                                              },
                                            );
                                          },
                                          child: profileInfo(
                                            heading: 'Following',
                                            count:
                                                '${_.userProfile!.following!.length}',
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
                                        '${_.userProfile!.user!.bio}',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _.tapFunction = 0;
                                              _.update();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                gradient: _.tapFunction == 0
                                                    ? const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff85BAF8),
                                                          Color(0xff8BDAA2)
                                                        ],
                                                      )
                                                    : const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
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
                                                  style: _.tapFunction == 0
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
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                gradient: _.tapFunction == 1
                                                    ? const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff85BAF8),
                                                          Color(0xff8BDAA2)
                                                        ],
                                                      )
                                                    : const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.white,
                                                          Colors.white,
                                                        ],
                                                      ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Answer',
                                                  style: _.tapFunction == 1
                                                      ? CommonTextStyle.style1
                                                      : CommonTextStyle.style4,
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
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                gradient: _.tapFunction == 2
                                                    ? const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff85BAF8),
                                                          Color(0xff8BDAA2)
                                                        ],
                                                      )
                                                    : const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.white,
                                                          Colors.white,
                                                        ],
                                                      ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Saved',
                                                  style: _.tapFunction == 2
                                                      ? CommonTextStyle.style1
                                                      : CommonTextStyle.style4,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ).marginOnly(bottom: 2, top: 2),
                                    ),
                                    _.tapFunction == 0
                                        ? questionContainer(_)
                                        : _.tapFunction == 1
                                            ? answerContainer(_)
                                            : savedContainer(_),
                                  ],
                                ).marginOnly(
                                  left: 25.0,
                                  right: 25.0,
                                  bottom: 35.0,
                                  top: 10.0,
                                )
                              ],
                            ),
                          ),
                        ),
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
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.detailPost, arguments: '64261b4bd25c661c4a342972');
      },
      child: Container(
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
      ),
    );
  }

  Widget questionContainer(ProfileController _) {
    return _.questionPosts.isEmpty
        ? const Center(
            child: Text(
              'No Data Found',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _.questionPosts.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost,
                      arguments: _.questionPosts[i].id);
                },
                onUserProfileTap: () async {
                  if (Get.currentRoute == '/userprofileRoute') {
                    _.isLoading = true;
                    _.userId = _.questionPosts[i].user!.id!;
                    _.update();
                    await _.getSingleUser(_.userId);
                    await _.getLoggedUser();
                    await _.getQuestionUser();
                    await _.getAnswerUser();
                    _.isLoading = false;
                    _.update();
                  }
                },
                userId: _.questionPosts[i].user!.id,
                userPhoto: _.questionPosts[i].user!.photoPath == null
                    ? ''
                    : _.questionPosts[i].user!.photoPath!,
                userName:
                    '${_.questionPosts[i].user!.firstName} ${_.questionPosts[i].user!.lastName}',
                location: _.questionPosts[i].location ?? '',
                content: _.questionPosts[i].body,
                imagesList: _.questionPosts[i].images!,
                rowWidget: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_.questionPosts[i].like.value == true ||
                            _.isLike(_.questionPosts[i].likes!)) {
                          var c = await _.dislikePosts(_.questionPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.questionPosts[i].like.value = false;
                            _.questionPosts[i].likes!.length--;
                            _.update();
                          }
                        } else {
                          var c = await _.likePosts(_.questionPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.questionPosts[i].like.value = true;
                            _.questionPosts[i].likes!.length++;
                            _.update();
                          }
                        }
                      },
                      child: Obx(
                        () => Icon(
                          _.questionPosts[i].like.value == true ||
                                  _.isLike(_.questionPosts[i].likes!)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 22,
                          color: const Color(0xff85BAF8),
                        ),
                      ),
                    ),
                    Text(
                      "${_.questionPosts[i].likes!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 14),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailPost,
                            arguments: _.questionPosts[i].id);
                      },
                      child: Image.asset(
                        AppAssets.comment,
                        height: 16,
                        width: 16.89,
                      ),
                    ),
                    Text(
                      "${_.questionPosts[i].comments!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 15),
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          if (_.questionPosts[i].save.value == true ||
                              _.isSave(_.questionPosts[i].id!)) {
                            var c = await _.unSavePosts(_.questionPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.questionPosts[i].save.value = false;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post unsaved', Colors.green);
                            }
                          } else {
                            var c = await _.savePosts(_.questionPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.questionPosts[i].save.value = true;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post saved', Colors.green);
                            }
                          }
                        },
                        icon: _.questionPosts[i].save.value == true ||
                                _.isSave(_.questionPosts[i].id!)
                            ? const Icon(
                                Icons.bookmark,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              )
                            : const Icon(
                                Icons.bookmark_border_rounded,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              ),
                      ),
                    ),
                    Image.asset(
                      AppAssets.share,
                      width: 12.08,
                      height: 13.38,
                    ).marginOnly(left: 13),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        openBottomSheet(_);
                      },
                      child: Image.asset(AppAssets.dots).marginOnly(
                        right: 19,
                      ),
                    ),
                  ],
                ).marginOnly(left: 22),
              );
            },
          );
  }

  Widget answerContainer(ProfileController _) {
    return _.answerPosts.isEmpty
        ? const Center(
            child: Text(
              'No Data Found',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _.answerPosts.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost,
                      arguments: _.answerPosts[i].id);
                },
                userId: _.answerPosts[i].user!.id,
                onUserProfileTap: () async {
                  if (Get.currentRoute == '/userprofileRoute') {
                    _.isLoading = true;
                    _.userId = _.answerPosts[i].user!.id!;
                    _.update();
                    await _.getSingleUser(_.userId);
                    await _.getLoggedUser();
                    await _.getQuestionUser();
                    await _.getAnswerUser();
                    _.isLoading = false;
                    _.update();
                  }
                },
                userPhoto: _.answerPosts[i].user!.photoPath == null
                    ? ''
                    : _.answerPosts[i].user!.photoPath!,
                userName:
                    '${_.answerPosts[i].user!.firstName} ${_.answerPosts[i].user!.lastName}',
                location: _.answerPosts[i].location ?? '',
                content: _.answerPosts[i].body,
                imagesList: _.answerPosts[i].images!,
                rowWidget: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_.answerPosts[i].like.value == true ||
                            _.isLike(_.answerPosts[i].likes!)) {
                          var c = await _.dislikePosts(_.answerPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.answerPosts[i].like.value = false;
                            _.answerPosts[i].likes!.length--;
                            _.update();
                          }
                        } else {
                          var c = await _.likePosts(_.answerPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.answerPosts[i].like.value = true;
                            _.answerPosts[i].likes!.length++;
                            _.update();
                          }
                        }
                      },
                      child: Obx(
                        () => Icon(
                          _.answerPosts[i].like.value == true ||
                                  _.isLike(_.answerPosts[i].likes!)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 22,
                          color: const Color(0xff85BAF8),
                        ),
                      ),
                    ),
                    Text(
                      "${_.answerPosts[i].likes!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 14),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailPost,
                            arguments: _.answerPosts[i].id);
                      },
                      child: Image.asset(
                        AppAssets.comment,
                        height: 16,
                        width: 16.89,
                      ),
                    ),
                    Text(
                      "${_.answerPosts[i].comments!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 15),
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          if (_.answerPosts[i].save.value == true ||
                              _.isSave(_.answerPosts[i].id!)) {
                            var c = await _.unSavePosts(_.answerPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.answerPosts[i].save.value = false;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post unsaved', Colors.green);
                            }
                          } else {
                            var c = await _.savePosts(_.answerPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.answerPosts[i].save.value = true;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post saved', Colors.green);
                            }
                          }
                        },
                        icon: _.answerPosts[i].save.value == true ||
                                _.isSave(_.answerPosts[i].id!)
                            ? const Icon(
                                Icons.bookmark,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              )
                            : const Icon(
                                Icons.bookmark_border_rounded,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              ),
                      ),
                    ),
                    Image.asset(
                      AppAssets.share,
                      width: 12.08,
                      height: 13.38,
                    ).marginOnly(left: 13),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        openBottomSheet(_);
                      },
                      child: Image.asset(AppAssets.dots).marginOnly(
                        right: 19,
                      ),
                    ),
                  ],
                ).marginOnly(left: 22),
              );
            },
          );
  }

  Widget savedContainer(ProfileController _) {
    return _.savePost.isEmpty
        ? const Center(
            child: Text(
              'No Data Found',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _.savePost.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost, arguments: _.savePost[i].id);
                },
                userId: _.savePost[i].user!.id,
                onUserProfileTap: () async {
                  if (Get.currentRoute == '/userprofileRoute') {
                    _.isLoading = true;
                    _.userId = _.savePost[i].user!.id!;
                    _.update();
                    await _.getSingleUser(_.userId);
                    await _.getLoggedUser();
                    await _.getQuestionUser();
                    await _.getAnswerUser();
                    _.isLoading = false;
                    _.update();
                  }
                },
                userPhoto: _.savePost[i].user!.photoPath == null
                    ? ''
                    : _.savePost[i].user!.photoPath!,
                userName:
                    '${_.savePost[i].user!.firstName} ${_.savePost[i].user!.lastName}',
                location: _.savePost[i].location ?? '',
                content: _.savePost[i].body,
                imagesList: _.savePost[i].images!,
                rowWidget: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_.savePost[i].like.value == true ||
                            _.isLike(_.savePost[i].likes!)) {
                          var c = await _.dislikePosts(_.savePost[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.savePost[i].like.value = false;
                            _.savePost[i].likes!.length--;
                            _.update();
                          }
                        } else {
                          var c = await _.likePosts(_.savePost[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.savePost[i].like.value = true;
                            _.savePost[i].likes!.length++;
                            _.update();
                          }
                        }
                      },
                      child: Obx(
                        () => Icon(
                          _.savePost[i].like.value == true ||
                                  _.isLike(_.savePost[i].likes!)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 22,
                          color: const Color(0xff85BAF8),
                        ),
                      ),
                    ),
                    Text(
                      "${_.savePost[i].likes!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 14),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailPost,
                            arguments: _.savePost[i].id);
                      },
                      child: Image.asset(
                        AppAssets.comment,
                        height: 16,
                        width: 16.89,
                      ),
                    ),
                    Text(
                      "${_.savePost[i].comments!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 15),
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          if (_.savePost[i].save.value == true ||
                              _.isSave(_.savePost[i].id!)) {
                            var c = await _.unSavePosts(_.savePost[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.savePost[i].save.value = false;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post unsaved', Colors.green);
                            }
                          } else {
                            var c = await _.savePosts(_.savePost[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.savePost[i].save.value = true;
                              _.update();
                              CommonSnackbar.getSnackbar(
                                  "Success", 'post saved', Colors.green);
                            }
                          }
                        },
                        icon: _.savePost[i].save.value == true ||
                                _.isSave(_.savePost[i].id!)
                            ? const Icon(
                                Icons.bookmark,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              )
                            : const Icon(
                                Icons.bookmark_border_rounded,
                                size: 22,
                                color: Color(0xffB6E2A1),
                              ),
                      ),
                    ),
                    Image.asset(
                      AppAssets.share,
                      width: 12.08,
                      height: 13.38,
                    ).marginOnly(left: 13),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        openBottomSheet(_);
                      },
                      child: Image.asset(AppAssets.dots).marginOnly(
                        right: 19,
                      ),
                    ),
                  ],
                ).marginOnly(left: 22),
              );
            },
          );
  }

  void openBottomSheet(ProfileController _) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                const Text(
                  'Report abuse',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xff85baf8),
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            CommonTextField(
              controller: _.report,
              radius: 23.0,
              bordercolor: AppColors.textFieldBorderColor,
              hintText: "type your answer here",
              fillcolor: AppColors.whiteColor,
              maxlines: 8,
            ),
            const SizedBox(
              height: 33,
            ),
            Center(
              child: CommonButton(
                  text: "Submit",
                  textStyle: CommonTextStyle.style1,
                  onPressed: () async {
                    Get.back();
                  },
                  fillColor: AppColors.buttonColor),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ).marginOnly(left: 33, right: 33),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
