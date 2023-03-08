import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/controllers/ask_question/ask_question_controller.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textfields/commn_textfield.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: bodyData(context),
      ),
      // endDrawer: new AppDrawer(),
      //  endDrawer: AppDrawer(),

      appBar: AppBar(
        backgroundColor: AppColors.discoverBackgroundColor1,
        elevation: 0.0,
      ),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<AskQuestionController>(
        init: AskQuestionController(),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.close,
                        color: AppColors.buttonColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${AppStrings.ask}",
                        style: CommonTextStyle.style2,
                      ).marginOnly(top: 55),
                      Text(
                        " ${AppStrings.question}",
                        style: CommonTextStyle.style3,
                      ).marginOnly(top: 55),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("${AppAssets.profilePic}"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(color: AppColors.buttonColor)),
                        width: 75,
                        height: 24,
                        child: Center(
                            child: Text(
                          "${AppStrings.public}",
                          style: CommonTextStyle.style1withBlueColor,
                        )),
                      ).marginOnly(left: 20),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23.0),
                        border:
                            Border.all(color: AppColors.textFieldBorderColor)),
                    width: Get.width,
                    height: Get.height / 3.8,
                    child: CommonTextField(
                      controller: _.typeQuestion,
                      fillcolor: Colors.white,
                      hintText: "type your question here",
                      maxlines: 10,
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
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.buttonColor,
                          size: 40,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${AppAssets.cameraUploadImg}")
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23.0),
                          border:
                              Border.all(color: AppColors.textFieldBorderColor),
                        ),
                      ).marginOnly(left: 12),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${AppAssets.cameraUploadImg}")
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23.0),
                          border:
                          Border.all(color: AppColors.textFieldBorderColor),
                        ),
                      ).marginOnly(left: 12),


                    ],
                  ).marginOnly(top: 22),

                  Row(
                    children: [
                      Image.asset("${AppAssets.img}").marginOnly(right:20 ),
                      Image.asset("${AppAssets.gif}")


                    ],
                  ).marginOnly(top: 32),

                  //-------------------Select category---------------

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColors.textFieldBorderColor)),
                    width: Get.width,
                    height: 44,
                    child: Row(
                      children: [
                        Text("Select Category",style: CommonTextStyle.style1withHintTextColor,).marginOnly(left: 21),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down,size: 20,).marginOnly(right: 18)

                      ],
                    ),
                  ).marginOnly(top: 25),
                  //-------------------Add location---------------

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColors.textFieldBorderColor)),
                    width: Get.width,
                    height: 44,
                    child: Row(
                      children: [
                        Text("Add location",style: CommonTextStyle.style1withHintTextColor,).marginOnly(left: 21),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down,size: 20,).marginOnly(right: 18)

                      ],
                    ),
                  ).marginOnly(top: 23),
                  CommonButton(text: "Ask Question", textStyle: CommonTextStyle.style1, onPressed: (){}, fillColor: AppColors.buttonColor).marginOnly(top: 35,bottom: 20)


                ],
              ).marginOnly(left: 43, right: 35),
            ),
          );
        });
  }
}
