import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';

class SearchCategoryController extends GetxController {
  bool isLoading = true;

  int tapFunction = 0;

  String heading = '';

  @override
  void onInit() {
    if (Get.arguments != null) {
      heading = Get.arguments;
      update();
    }
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
