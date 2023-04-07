import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/answer/answer_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';

import '../../utils/isLoading.dart';

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
        return _.isLoading
            ? const Loading()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.search,
                      style: CommonTextStyle.style2,
                    ),
                    CommonTextField(
                      controller: _.searchController,
                      radius: 25.0,
                      suffixicon: const Icon(Icons.search),
                      bordercolor: AppColors.textFieldBorderColor,
                      hintText: "Search Questions/ Users",
                      fillcolor: AppColors.whiteColor,
                    ).marginOnly(top: 45),
                    GestureDetector(
                      onTap: () {
                        openBottomSheet(_);
                      },
                      child: Container(
                        height: 35,
                        width: 174,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Obx(
                                () => Text(
                                  _.location.value.text,
                                  maxLines: 1,
                                  style: CommonTextStyle.style1,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ).marginOnly(left: 20, right: 20),
                      ).marginOnly(top: 36, bottom: 36),
                    ),
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

  void openBottomSheet(AnswerController _) {
    Get.bottomSheet(
      StatefulBuilder(builder: (ctx, setState) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                const Text(
                  'Filter by location',
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
              controller: _.searchLocation,
              radius: 25.0,
              suffixicon: const Icon(Icons.search),
              bordercolor: AppColors.textFieldBorderColor,
              hintText: "Search Location",
              fillcolor: AppColors.whiteColor,
            ),
            const SizedBox(
              height: 27,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _.locationList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 29,
                ),
                itemBuilder: (c, i) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        setState(() {
                          _.location.value.text = _.locationList[i]['name'];
                          _.update();
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff8BDAA2)),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  color: _.location.value.text ==
                                          _.locationList[i]['name']
                                      ? const Color(0xff8BDAA2)
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 22.0,
                          ),
                          Flexible(
                            child: Text(
                              _.locationList[i]['name'],
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff1e1e1e)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ).marginOnly(left: 33, right: 33);
      }),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
