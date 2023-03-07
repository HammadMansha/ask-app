import 'package:ask/controllers/inbox/inbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_strings/app_strings.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: bodyData(context),
      ),


      appBar: AppBar(
        backgroundColor: AppColors.discoverBackgroundColor1,
        elevation: 0.0,
      ),
    );
  }
  Widget bodyData(context){
    return GetBuilder<InboxScreenController>(init: InboxScreenController(),builder: (_){
      return SingleChildScrollView(
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppStrings.inbox}",
                style: CommonTextStyle.style2,
              ).marginOnly(top: 25),
              Center(
                  child: Container(
                    width: Get.width / 1.7,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CommonButton4(text: "Public", textStyle: CommonTextStyle.style1, onPressed: (){},fillColor: Colors.transparent,),
                        // CommonButton4(text: "Followers", textStyle: CommonTextStyle.style4, onPressed: (){},fillColor: Colors.white,)
                        //

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.indigoAccent.shade100,
                                    Colors.green.shade100
                                  ])),
                          width: 100,
                          height: 35,
                          child: Center(
                              child: Text(
                                "${AppStrings.received}",
                                style: CommonTextStyle.style1,
                              )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                                "${AppStrings.sent}",
                                style: CommonTextStyle.style4,
                              )),
                        ),
                      ],
                    ).marginOnly(bottom: 2, top: 2),
                  ).marginOnly(top: 26)),
              //-------------------first card without image---------


              //-------------------------Listview builder-------------
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: Get.height /4.3,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.0),
                            border: Border.all(
                                color: AppColors.textFieldBorderColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset("${AppAssets.profilePic}")
                                      .marginOnly(left: 22, top: 14),
                                  Center(
                                    child: Text(
                                      "${AppStrings.discoverUsername}",
                                      style: CommonTextStyle
                                          .style6font10weight400black,
                                    ).marginOnly(top: 15, left: 9),
                                  ),
                                  Text(
                                    "${AppStrings.discoverPostTime}",
                                    style:
                                    CommonTextStyle.style6font10weight400,
                                  ).marginOnly(top: 12, left: 9),
                                  Spacer(),
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.buttonColor,
                                    size: 12,
                                  ).marginOnly(top: 15),
                                  Text(
                                    "${AppStrings.discoverPostTLocation}",
                                    style:
                                    CommonTextStyle.style6font10weight400,
                                  ).marginOnly(top: 15, left: 3, right: 15),
                                ],
                              ),
                              Text(
                                "${AppStrings.public}",
                                style: CommonTextStyle.style6font10weight400,
                              ).marginOnly(top: 5, left: 25, right: 15),
                              Text(
                                "${AppStrings.discoverPostContent}",
                                style: CommonTextStyle.style5font14weight500,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ).marginOnly(top: 5, left: 25, right: 15),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(23),
                                      bottomRight: Radius.circular(23),
                                    ),
                                    border: Border.all(
                                        color: AppColors.textFieldBorderColor),

                                  ),
                                  child: Center(child: Text("${AppStrings.answerQuestion}",style: CommonTextStyle.style1,)),
                                ),
                              ),

                            ],
                          ),
                        ).marginOnly(right: 35, bottom: 12, top: 11),

                        Container(
                          height: Get.height / 2.4,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23.0),
                            border: Border.all(
                                color: AppColors.textFieldBorderColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset("${AppAssets.profilePic}")
                                      .marginOnly(left: 22, top: 14),
                                  Center(
                                    child: Text(
                                      "${AppStrings.discoverUsername}",
                                      style: CommonTextStyle
                                          .style6font10weight400black,
                                    ).marginOnly(top: 15, left: 9),
                                  ),
                                  Text(
                                    "${AppStrings.discoverPostTime}",
                                    style:
                                    CommonTextStyle.style6font10weight400,
                                  ).marginOnly(top: 12, left: 9),
                                  Spacer(),
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.buttonColor,
                                    size: 12,
                                  ).marginOnly(top: 15),
                                  Text(
                                    "${AppStrings.discoverPostTLocation}",
                                    style:
                                    CommonTextStyle.style6font10weight400,
                                  ).marginOnly(top: 15, left: 3, right: 15),
                                ],
                              ),
                              Text(
                                "${AppStrings.public}",
                                style: CommonTextStyle.style6font10weight400,
                              ).marginOnly(top: 5, left: 25, right: 15),
                              Text(
                                "${AppStrings.discoverPostContent}",
                                style: CommonTextStyle.style5font14weight500,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ).marginOnly(top: 5, left: 25, right: 15),
                              Container(
                                height: 130,
                                width: Get.width,
                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                        image:
                                        AssetImage(AppAssets.postImage))),
                              ).marginSymmetric(horizontal: 4),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(23),
                                      bottomRight: Radius.circular(23),
                                    ),
                                    border: Border.all(
                                        color: AppColors.textFieldBorderColor),

                                  ),
                                  child: Center(child: Text("${AppStrings.answerQuestion}",style: CommonTextStyle.style1,)),
                                ),
                              ),

                            ],
                          ),
                        ).marginOnly(right: 35, bottom: 12, top: 11),
                      ],
                    );
                  },
                ),
              )
            ],
          ).marginOnly(left: 35),
        ),
      );

    });


  }
}
