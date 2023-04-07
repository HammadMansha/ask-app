import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../controllers/discover/discover_controller.dart';
import '../../utils/commonContainer.dart';
import '../../utils/isLoading.dart';
import '../../utils/snackbar.dart';
import '../../widgets/common_buttons/common_button.dart';
import '../../widgets/common_textfields/commn_textfield.dart';

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
          return _.isLoading
              ? const Loading()
              : Column(
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                            _.tapFunction == 0
                                ? publicContainer(_)
                                : followersContainer(_),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(left: 25, right: 25);
        });
  }

  Widget publicContainer(DiscoverScreenController _) {
    return _.publicPosts.isEmpty
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
            itemCount: _.publicPosts.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost,
                      arguments: _.publicPosts[i].id);
                },
                userId: _.publicPosts[i].user!.id,
                userPhoto: _.publicPosts[i].user!.photoPath == null
                    ? ''
                    : _.publicPosts[i].user!.photoPath!,
                userName:
                    '${_.publicPosts[i].user!.firstName} ${_.publicPosts[i].user!.lastName}',
                location: _.publicPosts[i].location ?? '',
                content: _.publicPosts[i].body,
                imagesList: _.publicPosts[i].images!,
                rowWidget: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_.publicPosts[i].like.value == true ||
                            _.isLike(_.publicPosts[i].likes!)) {
                          var c = await _.dislikePosts(_.publicPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.publicPosts[i].like.value = false;
                            _.publicPosts[i].likes!.length--;
                            _.update();
                          }
                        } else {
                          var c = await _.likePosts(_.publicPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.publicPosts[i].like.value = true;
                            _.publicPosts[i].likes!.length++;
                            _.update();
                          }
                        }
                      },
                      child: Obx(
                        () => Icon(
                          _.publicPosts[i].like.value == true ||
                                  _.isLike(_.publicPosts[i].likes!)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 22,
                          color: const Color(0xff85BAF8),
                        ),
                      ),
                    ),
                    Text(
                      "${_.publicPosts[i].likes!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 14),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailPost,
                            arguments: _.publicPosts[i].id);
                      },
                      child: Image.asset(
                        AppAssets.comment,
                        height: 16,
                        width: 16.89,
                      ),
                    ),
                    Text(
                      "${_.publicPosts[i].comments!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 15),
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          if (_.publicPosts[i].save.value == true ||
                              _.isSave(_.publicPosts[i].id!)) {
                            var c = await _.unSavePosts(_.publicPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.publicPosts[i].save.value = false;
                              _.update();
                              CommonSnackbar.getSnackbar("Success", 'post unsaved', Colors.green);
                            }
                          } else {
                            var c = await _.savePosts(_.publicPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.publicPosts[i].save.value = true;
                              _.update();
                              CommonSnackbar.getSnackbar("Success", 'post saved', Colors.green);
                            }
                          }
                        },
                        icon: _.publicPosts[i].save.value == true || _.isSave(_.publicPosts[i].id!)
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

  Widget followersContainer(DiscoverScreenController _) {
    return _.followersPosts.isEmpty
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
            itemCount: _.followersPosts.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost,
                      arguments: _.followersPosts[i].id);
                },
                userId: _.followersPosts[i].user!.id!,
                userPhoto: _.followersPosts[i].user!.photoPath == null
                    ? ''
                    : _.followersPosts[i].user!.photoPath!,
                userName:
                    '${_.followersPosts[i].user!.firstName} ${_.followersPosts[i].user!.lastName}',
                location: _.followersPosts[i].user!.location!.isEmpty
                    ? ''
                    : '${_.followersPosts[i].user!.location![0]}',
                content: _.followersPosts[i].body,
                imagesList: _.followersPosts[i].images!,
                rowWidget: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_.followersPosts[i].like.value == true ||
                            _.followersPosts[i].likes!.isNotEmpty) {
                          var c = await _.dislikePosts(_.followersPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.followersPosts[i].like.value = false;
                            _.followersPosts[i].likes!.length--;
                            _.update();
                          }
                        } else {
                          var c = await _.likePosts(_.followersPosts[i].id!);
                          if (c >= 200 && c <= 300) {
                            _.followersPosts[i].like.value = true;
                            _.followersPosts[i].likes!.length++;
                            _.update();
                          }
                        }
                      },
                      child: Obx(
                        () => Icon(
                          _.followersPosts[i].like.value == true ||
                                  _.followersPosts[i].likes!.isNotEmpty
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 22,
                          color: const Color(0xff85BAF8),
                        ),
                      ),
                    ),
                    Text(
                      "${_.followersPosts[i].likes!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 14),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailPost,
                            arguments: _.followersPosts[i].id);
                      },
                      child: Image.asset(
                        AppAssets.comment,
                        height: 16,
                        width: 16.89,
                      ),
                    ),
                    Text(
                      "${_.followersPosts[i].comments!.length}",
                      style: CommonTextStyle.style4,
                    ).marginOnly(left: 8, right: 15),
                    Obx(
                      () => IconButton(
                        onPressed: () async {
                          if (_.followersPosts[i].save.value == true ||
                              _.isSave(_.followersPosts[i].id!)) {
                            var c = await _.unSavePosts(_.followersPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.followersPosts[i].save.value = false;
                              _.update();
                              CommonSnackbar.getSnackbar("Success", 'post unsaved', Colors.green);
                            }
                          } else {
                            var c = await _.savePosts(_.followersPosts[i].id!);
                            if (c >= 200 && c <= 300) {
                              await _.getSavePosts();
                              _.followersPosts[i].save.value = true;
                              _.update();
                              CommonSnackbar.getSnackbar("Success", 'post saved', Colors.green);
                            }
                          }
                        },
                        icon: _.followersPosts[i].save.value == true || _.isSave(_.followersPosts[i].id!)
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
                    ).marginOnly(left: 27),
                    const Spacer(),
                    GestureDetector(
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

  void openBottomSheet(DiscoverScreenController _) {
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
