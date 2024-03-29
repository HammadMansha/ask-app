import 'dart:io';

import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/drawer_items/editprofile_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../utils/circleImage.dart';
import '../../utils/isLoading.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: bodyData(context),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (_) {
        return SafeArea(
          child: _.isLoading
              ? const Loading()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                AppStrings.heading,
                                style: CommonTextStyle.style2,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                _.selectCoverImage();
                              },
                              child: Container(
                                width: Get.width,
                                height: 247,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23.0),
                                    border: Border.all(
                                      color: const Color(
                                        0xff85BAF8,
                                      ),
                                    ),
                                    image: _.coverImage != null
                                        ? DecorationImage(
                                            image: FileImage(
                                              File(
                                                _.coverImage!.path,
                                              ),
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : _.coverPic.isEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(_.coverPic),
                                                fit: BoxFit.cover,
                                              )
                                            : null),
                                child: _.coverImage != null ||
                                        _.coverPic.isNotEmpty
                                    ? null
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppStrings.upload,
                                            style:
                                                CommonTextStyle.styleTextColor,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Icon(
                                            Icons.cloud_upload,
                                            color: Color(0xff1E1E1E),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            _.profileImage == null
                                ? GestureDetector(
                                    onTap: () {
                                      _.selectImage();
                                    },
                                    child: CircularCachedNetworkImage(
                                        imageURL: _.profilePic.isEmpty
                                            ? AppAssets.avatar
                                            : _.profilePic,
                                        height: 145,
                                        width: 145,
                                        borderColor: Colors.black,
                                        borderWidth: 1),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      _.selectImage();
                                    },
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
                                            offset: const Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        image: DecorationImage(
                                            image: FileImage(
                                              File(_.profileImage!.path),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CommonTextField(
                              controller: _.name,
                              hintText: "Name",
                              bordercolor: AppColors.textFieldBorderColor,
                              fillcolor: Colors.white,
                              radius: 7,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CommonTextField(
                              controller: _.lname,
                              hintText: "Last Name",
                              bordercolor: AppColors.textFieldBorderColor,
                              fillcolor: Colors.white,
                              radius: 7,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CommonTextField(
                              controller: _.username,
                              hintText: "Username",
                              bordercolor: AppColors.textFieldBorderColor,
                              fillcolor: Colors.white,
                              radius: 7,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CommonTextField(
                              controller: _.email,
                              hintText: "Email",
                              bordercolor: AppColors.textFieldBorderColor,
                              fillcolor: Colors.white,
                              radius: 7,
                              readOnly: true,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CommonTextField(
                              controller: _.bio,
                              hintText: "Bio",
                              bordercolor: AppColors.textFieldBorderColor,
                              fillcolor: Colors.white,
                              maxlines: 8,
                              radius: 7,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: CommonButton(
                                  text: "Update & Return",
                                  textStyle: CommonTextStyle.style1,
                                  onPressed: () {
                                    _.updateData();
                                  },
                                  fillColor: AppColors.buttonColor),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(left: 25, right: 25),
        );
      },
    );
  }
}
