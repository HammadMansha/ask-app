import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_assets/app_assets.dart';

class AnswerController extends GetxController{
TextEditingController searchController=TextEditingController();
List<String> imagesPath=[AppAssets.services,AppAssets.product,AppAssets.technology,AppAssets.resturant,AppAssets.handshake,AppAssets.threeHorizontalDote];
List<String> servicesText=[AppStrings.services,AppStrings.product,AppStrings.technology,AppStrings.product,AppStrings.buyAndSell,AppStrings.others];

}
