import 'dart:io';
import 'package:ask/controllers/ask_question/askquestion_user_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';
import '../../utils/isLoading.dart';
import '../../widgets/form/dropdown.dart';

class AskQuestionUserScreen extends StatelessWidget {
  const AskQuestionUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<AskQuestionUserontroller>(
      init: AskQuestionUserontroller(),
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
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child:  _.isLoading
              ? const Loading()
              : SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width,
                      height: Get.height / 3.3,
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
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          text:  TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Ask ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: '${_.name} ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36,
                                  color: Color(0xff747474),
                                ),
                              ),
                              const TextSpan(
                                text: 'a Question',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ).marginOnly(bottom: 30, left: 25, right: 25),
                      ),
                    ),
                  ),
                  Column(
                    children: [
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
                      //-------------------Add location---------------
                      CommonDropDownField(
                        placeholder: "Location",
                        controller: _.location,
                        values: _.locationList,
                        checkedvalue: _.location,
                        screenController: _,
                      ).marginOnly(top: 23),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CommonButton(
                        text: "Ask Question",
                        textStyle: CommonTextStyle.style1,
                        onPressed: () {
                          _.createPostWithImage();
                        },
                        fillColor: AppColors.buttonColor,
                      )
                    ],
                  ).marginOnly(left: 25, right: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
