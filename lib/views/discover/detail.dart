import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/discover/detail_controller.dart';
import 'package:ask/utils/snackbar.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../utils/circleImage.dart';
import '../../utils/dialog.dart';
import '../../utils/isLoading.dart';
import '../../widgets/common_textfields/commn_textfield.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xff1E1E1E),
            ).marginOnly(left: 15.0),
          ),
          extendBodyBehindAppBar: true,
          body: _.isLoading
              ? const Loading()
              : SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _.posts!.images!.isEmpty
                                ? CachedNetworkImage(
                                    imageUrl:
                                        'https://burst.shopifycdn.com/photos/landscape-of-green-rolling-hills-and-mountain-peaks.jpg?width=1850&format=pjpg&exif=1&iptc=1',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Image.asset(
                                      AppAssets.colorfulAsk,
                                      fit: BoxFit.cover,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AppAssets.colorfulAsk,
                                      fit: BoxFit.cover,
                                    ),
                                    width: Get.width,
                                    height: Get.height / 3.3,
                                  )
                                : SizedBox(
                                    height: Get.height / 3.3,
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                        height: Get.height / 3.3,
                                        viewportFraction: 1,
                                      ),
                                      items: _.posts!.images!.map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return CachedNetworkImage(
                                              imageUrl: i,
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
                                              width: Get.width,
                                              height: Get.height / 3.3,
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    const Text(
                                      'Reply in thread',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 15,
                                        color: Color(0xff85BAF8),
                                      ),
                                    )
                                  ],
                                ).marginOnly(top: 10.0),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.userprofile,
                                            arguments: _.posts!.user!.id);
                                      },
                                      child: CircularCachedNetworkImage(
                                        imageURL:
                                            _.posts!.user!.photoPath == null
                                                ? AppAssets.avatar
                                                : _.posts!.user!.photoPath!,
                                        height: 32,
                                        width: 32,
                                        errorImage: AppAssets.profilePic,
                                        borderColor: Colors.white,
                                      ).marginOnly(top: 14),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.userprofile,
                                            arguments: _.posts!.user!.id);
                                      },
                                      child: Center(
                                        child: Text(
                                          '${_.posts!.user!.firstName} ${_.posts!.user!.lastName}',
                                          style: CommonTextStyle
                                              .style6font10weight400black,
                                        ).marginOnly(top: 15, left: 9),
                                      ),
                                    ),
                                    Text(
                                      AppStrings.discoverPostTime,
                                      style:
                                          CommonTextStyle.style6font10weight400,
                                    ).marginOnly(top: 12, left: 9),
                                  ],
                                ).marginOnly(top: 10.0),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${_.posts!.body}',
                                    style: const TextStyle(
                                      color: Color(0xff1E1E1E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ).marginOnly(top: 20.0),
                                SizedBox(
                                  height: Get.height / 2.9,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(0.0),
                                    shrinkWrap: true,
                                    itemCount: _.posts!.comments == null
                                        ? 0
                                        : _.posts!.comments!.length,
                                    itemBuilder: (c, i) {
                                      return InkWell(
                                        onLongPress: () {
                                          ShowDeleteDialog.getDialog(() {
                                            Get.back();
                                            _.deleteComment(
                                                _.posts!.comments![i]['_id']);
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Image.asset(
                                                AppAssets.replay,
                                                width: 18.84,
                                                height: 14.41,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.toNamed(
                                                          Routes.userprofile,
                                                          arguments: _.posts!
                                                                  .comments![i]
                                                              ['user']['id'],
                                                        );
                                                      },
                                                      child:
                                                          CircularCachedNetworkImage(
                                                        imageURL: _.posts!
                                                                        .comments![
                                                                    i]['user']
                                                                ['photoPath'] ??
                                                            AppAssets.avatar,
                                                        height: 32,
                                                        width: 32,
                                                        errorImage: AppAssets
                                                            .profilePic,
                                                        borderColor:
                                                            Colors.white,
                                                      ).marginOnly(top: 14),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            Routes.userprofile,
                                                            arguments: _.posts!
                                                                    .comments![i]
                                                                ['user']['id']);
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          '${_.posts!.comments![i]['user']['firstName']} ${_.posts!.comments![i]['user']['lastName']}',
                                                          style: CommonTextStyle
                                                              .style6font10weight400black,
                                                        ).marginOnly(
                                                            top: 15, left: 9),
                                                      ),
                                                    ),
                                                    Text(
                                                      AppStrings
                                                          .discoverPostTime,
                                                      style: CommonTextStyle
                                                          .style6font10weight400,
                                                    ).marginOnly(
                                                        top: 12, left: 9),
                                                  ],
                                                ).marginOnly(top: 10.0),
                                                SizedBox(
                                                  width: Get.width / 1.5,
                                                  child: Text(
                                                    '${_.posts!.comments![i]['body']}',
                                                    style: const TextStyle(
                                                      color: Color(0xff1E1E1E),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ).marginOnly(top: 20.0),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).marginOnly(top: 10.0),
                                ),
                              ],
                            ).marginOnly(left: 25, right: 25),
                          ],
                        ),
                      ),
                      CommonTextField(
                        controller: _.typeQuestion,
                        hintText: "Type text here..",
                        bordercolor: AppColors.textFieldBorderColor,
                        fillcolor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        radius: 7,
                        maxlines: 2,
                        onFieldSubmitted: (c) {
                          if (_.typeQuestion.text.isNotEmpty) {
                            _.writeComment();
                          } else {
                            CommonSnackbar.getSnackbar('Warning',
                                'Please enter some text', Colors.blue);
                          }
                        },
                      ).marginOnly(bottom: 40.0, left: 25, right: 25),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
