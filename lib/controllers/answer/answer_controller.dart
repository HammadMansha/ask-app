import 'dart:convert';

import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../constants/app_assets/app_assets.dart';
import '../../model/post_model.dart';

class AnswerController extends GetxController {
  bool isLoading = true;

  TextEditingController searchController = TextEditingController();
  TextEditingController searchLocation = TextEditingController();
  Rx<TextEditingController> location =
      TextEditingController(text: 'Location').obs;

  final storage = GetStorage();

  List<String> imagesPath = [
    AppAssets.services,
    AppAssets.product,
    AppAssets.technology,
    AppAssets.resturant,
    AppAssets.handshake,
    AppAssets.threeHorizontalDote
  ];
  List<String> servicesText = [
    AppStrings.services,
    AppStrings.product,
    AppStrings.technology,
    AppStrings.product,
    AppStrings.buyAndSell,
    AppStrings.others
  ];

  List locationList = [];

  @override
  void onInit() {
    locationList = [
      {
        'id': 'jeddah',
        'name': 'Jeddah',
      },
      {
        'id': 'makkah',
        'name': 'Makkah',
      },
      {
        'id': 'medinah',
        'name': 'Medinah',
      },
      {
        'id': 'riyadh',
        'name': 'Riyadh',
      },
      {
        'id': 'nyc',
        'name': 'NYC',
      },
      {
        'id': 'london',
        'name': 'London',
      },
      {
        'id': 'amsterdam',
        'name': 'Amsterdam',
      },
      {
        'id': 'brussels',
        'name': 'Brussels',
      },
    ];
    update();
    super.onInit();
  }

  @override
  void onReady() async {
    isLoading = false;
    update();
    super.onReady();
  }

}
