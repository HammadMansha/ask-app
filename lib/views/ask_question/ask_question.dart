import 'dart:io';

import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/ask_question/ask_question_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';
import '../../utils/isLoading.dart';
import '../../widgets/form/dropdown.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<AskQuestionController>(
        init: AskQuestionController(),
        builder: (_) {
          return _.isLoading
              ? const Loading()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            AppStrings.ask,
                            style: CommonTextStyle.style2,
                          ),
                          Text(
                            " ${AppStrings.question}",
                            style: CommonTextStyle.style3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(AppAssets.profilePic),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border:
                                    Border.all(color: AppColors.buttonColor)),
                            width: 75,
                            height: 24,
                            child: Center(
                                child: Text(
                              AppStrings.public,
                              style: CommonTextStyle.style1withBlueColor,
                            )),
                          ).marginOnly(left: 20),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.0),
                            border: Border.all(
                                color: AppColors.textFieldBorderColor)),
                        width: Get.width,
                        height: 220,
                        child: CommonTextField(
                          controller: _.typeQuestion,
                          fillcolor: Colors.white,
                          hintText: "type your question here",
                          maxlines: 8,
                        ),
                      ).marginOnly(top: 12),
                      SizedBox(
                        height: 75,
                        width: Get.width,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => _.selectImage(),
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23.0),
                                    border: Border.all(
                                        color: AppColors.textFieldBorderColor)),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColors.buttonColor,
                                  size: 40,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              height: 75,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _.imageFileList.length,
                                separatorBuilder: (c, e) => const SizedBox(
                                  width: 10.0,
                                ),
                                itemBuilder: (c, i) {
                                  return Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(_.imageFileList[i].path),
                                          ),
                                          fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(23.0),
                                      border: Border.all(
                                          color:
                                              AppColors.textFieldBorderColor),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ).marginOnly(top: 22),
                      //-------------------Select category---------------

                      CommonDropDownField(
                        placeholder: "Category",
                        controller: _.category,
                        values: _.categoryList,
                        checkedvalue: _.category,
                        screenController: _,
                      ).marginOnly(top: 25),
                      //-------------------Add location---------------
                      CommonDropDownField(
                        placeholder: "Location",
                        controller: _.location,
                        values: _.locationList,
                        checkedvalue: _.location,
                        screenController: _,
                      ).marginOnly(top: 23),
                      CommonButton(
                        text: "Ask Question",
                        textStyle: CommonTextStyle.style1,
                        onPressed: () {
                          _.createPostWithImage();
                        },
                        fillColor: AppColors.buttonColor,
                      ).marginOnly(top: 35, bottom: 20)
                    ],
                  ).marginOnly(left: 25, right: 25),
                );
        });
  }
}
