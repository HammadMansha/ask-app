import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreenController extends GetxController {
  bool isLoading = true;

  TextEditingController pin = TextEditingController();
  TextEditingController otp = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (Get.arguments != null) {
      otp.text = Get.arguments;
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
}
