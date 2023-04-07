import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets/app_assets.dart';
import '../constants/app_strings/app_strings.dart';
import '../widgets/common_textstyle/common_text_style.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'circleImage.dart';

class CommonContainer extends StatelessWidget {
  final String? id;
  final String? userId;
  final String? userPhoto;
  final String? userName;
  final String? location;
  final String? status;
  final String? content;
  final List imagesList;
  final Widget? rowWidget;
  final void Function()? onTap;
  final bool isImageView;
  final void Function()? onUserProfileTap;

  const CommonContainer({
    super.key,
    this.id,
    this.userId,
    this.userPhoto,
    this.userName,
    this.location,
    this.status,
    this.content,
    required this.imagesList,
    this.rowWidget,
    this.onTap,
    this.isImageView = true,
    this.onUserProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            GestureDetector(
              onTap: onUserProfileTap ?? () {
                print('check data is $userId');
                Get.toNamed(Routes.userprofile, arguments: userId);
              },
              child: Row(
                children: [
                  CircularCachedNetworkImage(
                    imageURL: userPhoto == '' ? AppAssets.avatar : userPhoto!,
                    height: 40,
                    width: 40,
                    errorImage: AppAssets.profilePic,
                    borderColor: Colors.white,
                  ).marginOnly(left: 22, top: 14),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.userprofile, arguments: userId);
                    },
                    child: Center(
                      child: Text(
                        userName ?? '',
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
                    location ?? '',
                    style: CommonTextStyle.style6font10weight400,
                  ).marginOnly(top: 15, left: 3, right: 15),
                ],
              ),
            ),
            Text(
              status ?? '',
              style: CommonTextStyle.style6font10weight400,
            ).marginOnly(top: 5, left: 25, right: 15),
            GestureDetector(
              onTap: onTap,
              child: Text(
                content ?? '',
                style: CommonTextStyle.style5font14weight500,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ).marginOnly(top: 5, left: 25, right: 15),
            ),
            const Spacer(),
            isImageView
                ? imagesList.isEmpty
                    ? GestureDetector(
                        onTap: onTap,
                        child: Center(
                          child: Image.asset(
                            AppAssets.colorfulAsk,
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: SizedBox(
                          height: 100,
                          width: Get.width,
                          child: AlignedGridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 5,
                            itemCount: imagesList.length,
                            itemBuilder: (c, i) {
                              return CachedNetworkImage(
                                imageUrl: imagesList[i],
                                placeholder: (context, url) => Image.asset(
                                  AppAssets.colorfulAsk,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppAssets.colorfulAsk,
                                  fit: BoxFit.cover,
                                ),
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      )
                : const SizedBox(),
            const Spacer(),
            rowWidget == null ? const SizedBox() : rowWidget!,
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
