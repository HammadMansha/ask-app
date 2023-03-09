import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import '../../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: '',
      subTitle: '',
      imageUrl: AppAssets.splash,
    ),
    Introduction(
      title: '',
      subTitle: '',
      imageUrl: AppAssets.splash2,
    ),
  ];
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  Widget bodyData(context) {
    Future. delayed(const Duration(seconds: 2), ()
    {
      Get.toNamed(Routes.signupOrLogin);
    });     
    return Container(
      height: Get.height,
      width: Get.width,
     
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.splash2),fit: BoxFit.fill
        )
      )
    );
  }
}
