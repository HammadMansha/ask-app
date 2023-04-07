import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../model/userProfile_model.dart';
import '../../model/user_model.dart';

class InfoController extends GetxController {
  String heading = '';

  bool isLoading = true;

  TextEditingController searchController = TextEditingController();
  UserProfile? userProfile;
  final storage = GetStorage();
  List<UserModel> profiles = [];

  @override
  void onInit() async {
    if (Get.arguments != null) {
      heading = await Get.arguments['heading'];
      await getSingleUser(Get.arguments['id']);
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

  Future<void> getSingleUser(String uid) async {
    try {
      print("id $uid");
      String token = await storage.read('access_token');
      var res = await http.post(
        Uri.parse(
          ApiData.baseUrl + ApiData.userProfilebyId,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {'id': uid},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      print('heck $data');
      if (statusCode >= 200 || statusCode <= 300) {
        userProfile = UserProfile.fromJson(data);
        update();
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      print('check data ${e.toString()}');
      isLoading = false;
      update();
    }
  }
}
