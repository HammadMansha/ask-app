import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/controllers/ask_question/askquestion_user_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';

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
            child: SingleChildScrollView(
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
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ask ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Hamziii ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36,
                                  color: Color(0xff747474),
                                ),
                              ),
                              TextSpan(
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
                      Row(
                        children: [
                          Container(
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
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.cameraUploadImg)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(23.0),
                              border: Border.all(
                                  color: AppColors.textFieldBorderColor),
                            ),
                          ).marginOnly(left: 12),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppAssets.cameraUploadImg)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(23.0),
                              border: Border.all(
                                  color: AppColors.textFieldBorderColor),
                            ),
                          ).marginOnly(left: 12),
                        ],
                      ).marginOnly(top: 22),
                      Row(
                        children: [
                          const Icon(
                            Icons.image_outlined,
                            size: 30,
                            color: Color(0xff85BAF8),
                          ).marginOnly(right: 10),
                          const Icon(
                            Icons.gif_box_outlined,
                            size: 30,
                            color: Color(0xff85BAF8),
                          )
                        ],
                      ).marginOnly(top: 32),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CommonButton(
                        text: "Ask Question",
                        textStyle: CommonTextStyle.style1,
                        onPressed: () {},
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
