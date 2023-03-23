import 'dart:convert';

import 'package:ask/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRemember = false;
  bool isLoading = true;

  final storage = GetStorage();

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> signInFun() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        update();
        var res = await http.post(
          Uri.parse(ApiData.baseUrl + ApiData.signIn),
          body: {
            "email": email.text,
            "password": password.text,
          },
        );
        print('check body ${res.body}');
        var statusCode = res.statusCode;
        var data = json.decode(res.body);
        if (statusCode >= 200 || statusCode <= 300) {
          await storage.write('id', data['user']['id']);
          await storage.write(
              'access_token', data['tokens']['access']['token']);
          await storage.write(
              'refresh_token', data['tokens']['refresh']['token']);
          Get.offAllNamed(Routes.dashboard);
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
