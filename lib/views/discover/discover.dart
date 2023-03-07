import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/widgets/common_buttons/common_button.dart';
import 'package:ask/widgets/common_textstyle/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/discover/discover_controller.dart';

class DiscoverScreen extends StatelessWidget {
   DiscoverScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: bodyData(context),
      ),
      drawerEnableOpenDragGesture: true,
     // endDrawer: new AppDrawer(),
     //  endDrawer: AppDrawer(),
      drawer: AppDrawer(),

      appBar: AppBar(
        backgroundColor: AppColors.discoverBackgroundColor1,
        elevation: 0.0,
      ),
    );
  }

  Widget bodyData(context) {

    return GetBuilder<DiscoverScreenController>(
        init: DiscoverScreenController(),
        builder: (_) {
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          scaffoldKey.currentState!.openDrawer();


                         print("hello");
                          },
                          child: Image.asset("${AppAssets.drawer}")),
                      Spacer(),
                      Image.asset("${AppAssets.profilePic}"),
                    ],
                  ).marginOnly(right: 35),
                  Text(
                    "${AppStrings.discover}",
                    style: CommonTextStyle.style2,
                  ).marginOnly(top: 25, left: 25),
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
                          height: 40,
                          child: Center(
                              child: Text(
                            "${AppStrings.public}",
                            style: CommonTextStyle.style1,
                          )),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          color: Colors.transparent,
                          child: Center(
                              child: Text(
                            "${AppStrings.follower}",
                            style: CommonTextStyle.style4,
                          )),
                        ),
                      ],
                    ).marginOnly(bottom: 2, top: 2),
                  ).marginOnly(top: 26)),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                height: 150,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(AppAssets.postImage))),
                              ).marginSymmetric(horizontal: 4),
                              Row(
                                children: [
                                  Image.asset("${AppAssets.heartLike}"),
                                  Text(
                                    "1.1k",
                                    style: CommonTextStyle.style4,
                                  ).marginOnly(left: 8, right: 14),
                                  Image.asset("${AppAssets.comment}"),
                                  Text(
                                    "1.1k",
                                    style: CommonTextStyle.style4,
                                  ).marginOnly(left: 8, right: 15),
                                  Image.asset("${AppAssets.bookmark}"),
                                  Image.asset("${AppAssets.share}")
                                      .marginOnly(left: 27),
                                  Spacer(),
                                  Image.asset("${AppAssets.dots}")
                                      .marginOnly(right: 19),
                                ],
                              ).marginOnly(left: 22),
                            ],
                          ),
                        ).marginOnly(right: 35, bottom: 12, top: 11);
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

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/1.3,
      child: Drawer(

        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              const SizedBox(height:200),
              ListTile(
                leading: Image.asset(AppAssets.person),
                title: Text(AppStrings.person,style:CommonTextStyle.style4,),
                trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.black,size: 13,),
              ),
              ListTile(
                leading: Image.asset(AppAssets.notification,height: 22,width: 22,),
                title: Text(AppStrings.notification,style:CommonTextStyle.style4,),
                trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.black,size: 13,),
              ),
              ListTile(
                leading: Image.asset(AppAssets.password),
                title: Text(AppStrings.passwordSetting,style:CommonTextStyle.style4,),
                trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.black,size: 13,),
              ),
              ListTile(
                leading: Image.asset(AppAssets.help),
                title: Text(AppStrings.helpCentre,style:CommonTextStyle.style4,),
                trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.black,size: 13,),
              ),
              ListTile(
                leading: Image.asset(AppAssets.colorfulAsk,height: 22,width: 22,),
                title: Text(AppStrings.whatIsAsk,style:CommonTextStyle.style4,),
                trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.black,size: 13,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
