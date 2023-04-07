import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/info/info_controller.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/circleImage.dart';
import '../../utils/isLoading.dart';
import '../../widgets/common_textfields/commn_textfield.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

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
    return GetBuilder<InfoController>(
      init: InfoController(),
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
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _.heading,
                            style: CommonTextStyle.style2,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CommonTextField(
                          controller: _.searchController,
                          radius: 55.0,
                          suffixicon: const Icon(Icons.search),
                          bordercolor: AppColors.textFieldBorderColor,
                          hintText: "Search here",
                          fillcolor: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _.heading == 'Following'
                        ?
                        _.userProfile!.following!.isEmpty
                            ? const Center(
                                child: Text(
                                  'No Data Found',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            : ListView.separated(
                                itemCount: _.userProfile!.following!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (c, i) {
                                  return const SizedBox(
                                    height: 10.0,
                                  );
                                },
                                itemBuilder: (c, i) {
                                  return userInfo(
                                    profileImage: _.userProfile!.following![i].photoPath,
                                    name: '${_.userProfile!.following![i].firstName} ${_.userProfile!.following![i].lastName}',
                                    id: _.userProfile!.following![i].id
                                  );
                                },
                              ).marginOnly(bottom: 25.0, top: 10.0)
                              :_.userProfile!.followers!.isEmpty
                              ? const Center(
                                child: Text(
                                  'No Data Found',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ) : ListView.separated(
                                itemCount: _.userProfile!.followers!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (c, i) {
                                  return const SizedBox(
                                    height: 10.0,
                                  );
                                },
                                itemBuilder: (c, i) {
                                  return userInfo(
                                    profileImage: _.userProfile!.followers![i].photoPath,
                                    name: '${_.userProfile!.followers![i].firstName} ${_.userProfile!.followers![i].lastName}',
                                    id: _.userProfile!.followers![i].id
                                  );
                                },
                              ).marginOnly(bottom: 25.0, top: 10.0),
                      ],
                    ).marginOnly(left: 25, right: 25),
                  ),
                ),
        );
      },
    );
  }

  Widget userInfo({String? profileImage , String? name , String? id}) {
    return Container(
      width: Get.width,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularCachedNetworkImage(
            imageURL: '',
            height: 32,
            width: 32,
            errorImage: AppAssets.profilePic,
            borderColor: Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            'Harry',
            style: CommonTextStyle.infoText,
          ),
          const Spacer(),
          ViewProfileButton(
            onPressed: () {
              Get.toNamed(Routes.userprofile , arguments: id);
            },
            text: 'Visit Profile',
            fillColor: const Color(0xff85BAF8),
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ],
      ).marginOnly(left: 10.0, right: 10.0),
    );
  }
}
