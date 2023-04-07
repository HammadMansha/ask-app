import 'package:ask/controllers/inbox/inbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../utils/commonContainer.dart';
import '../../utils/isLoading.dart';
import '../../widgets/common_textfields/commn_textfield.dart';
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
        return _.isLoading
            ? const Loading()
            : Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppStrings.inbox,
                              style: CommonTextStyle.style2,
                            ),
                          ),
                          const SizedBox(
                            height: 26,
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
                                      AppStrings.sent,
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
                          const SizedBox(
                            height: 10.0,
                          ),
                          _.tapFunction == 0
                              ? sendContainer(_)
                              : receivedContainer(_),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).marginOnly(left: 25, right: 25);
      },
    );
  }

  Widget sendContainer(InboxScreenController _) {
    return _.sendPost.isEmpty
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
            itemCount: _.sendPost.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost, arguments: _.sendPost[i].id);
                },
                userId: _.sendPost[i].user!.id,
                userPhoto: _.sendPost[i].user!.photoPath == null
                    ? ''
                    : _.sendPost[i].user!.photoPath!,
                userName:
                    '${_.sendPost[i].user!.firstName} ${_.sendPost[i].user!.lastName}',
                location: _.sendPost[i].location ?? '',
                content: _.sendPost[i].body,
                imagesList: _.sendPost[i].images!,
                isImageView: _.sendPost[i].images == null ? false : true,
              );
            },
          );
  }

  Widget receivedContainer(InboxScreenController _) {
    return _.recievedPost.isEmpty
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
            itemCount: _.recievedPost.length,
            separatorBuilder: (c, e) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (c, i) {
              return CommonContainer(
                onTap: () {
                  Get.toNamed(Routes.detailPost,
                      arguments: _.recievedPost[i].id);
                },
                userId: _.recievedPost[i].user!.id,
                userPhoto: _.recievedPost[i].user!.photoPath == null
                    ? ''
                    : _.recievedPost[i].user!.photoPath!,
                userName:
                    '${_.recievedPost[i].user!.firstName} ${_.recievedPost[i].user!.lastName}',
                location: _.recievedPost[i].location ?? '',
                content: _.recievedPost[i].body,
                imagesList: _.recievedPost[i].images!,
                isImageView: _.recievedPost[i].images == null ? false : true,
                rowWidget: _.onTap == i
                    ? Expanded(
                        child: CommonTextField(
                          controller: _.answer,
                          hintText: "Answer question",
                          bordercolor: AppColors.textFieldBorderColor,
                          fillcolor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          radius: 7,
                          suffixicon: const Icon(
                            Icons.photo_outlined,
                            size: 25,
                          ),
                        ).marginOnly(left: 10.0, right: 10.0),
                      )
                    : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _.onTap = i;
                            _.answer.clear();
                            _.update();
                            _.answer.clear();
                          },
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                              border: Border.all(
                                  color: AppColors.textFieldBorderColor),
                            ),
                            child: Center(
                                child: Text(
                              AppStrings.answerQuestion,
                              style: CommonTextStyle.style1,
                            )),
                          ),
                        ),
                      ),
              );
            },
          );
  }
}
