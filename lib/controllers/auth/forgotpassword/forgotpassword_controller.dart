import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../api/api.dart';
import '../../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  bool isLoading = true;

  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> forgotPasswordFun() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        update();
        var res = await http.post(
          Uri.parse(ApiData.baseUrl + ApiData.forgotpassword),
          body: {
            "email": email.text,
          },
        );
        print('check body ${res.body}');
        var statusCode = res.statusCode;
        var data = json.decode(res.body);
        if (statusCode >= 200 || statusCode <= 300) {
          Get.toNamed(Routes.otp);
        } else {
          isLoading = false;
          update();
        }
      }
    } catch (e) {
      isLoading = false;
      update();
    }
  }


}
