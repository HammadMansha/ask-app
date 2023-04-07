import 'dart:collection';
import 'dart:convert';
import 'package:ask/model/user_model.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class DashboardController extends GetxController {
  int currentindex = 0;
  ListQueue<int> navigationQueue = ListQueue();

  bool isLoading = true;
  final storage = GetStorage();

  UserModel? user;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    currentindex = index;

    if (index == currentindex) {
      navigationQueue.clear();
      navigationQueue.addLast(index);
      currentindex = index;
      update();
    }
    update();
  }

  @override
  void onReady() async {
    await getSingleUser();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getSingleUser() async {
    try {
      String token = await storage.read('access_token');
      String id = await storage.read('id');
      isLoading = true;
      update();
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.singleUser + id),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      print("logged user Data $data");
      if (statusCode >= 200 || statusCode <= 300) {
        user = UserModel.fromJson(data);
        update();
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
    }
  }

  Future<void> signout() async {
    try {
      String token = await storage.read('access_token');
      String refresh = await storage.read('refresh_token');
      String id = await storage.read('id');
      isLoading = true;
      update();
      var res = await http.post(
        Uri.parse(ApiData.baseUrl + ApiData.logout),
        body: {
          'refreshToken': refresh,
          'deviceToken': '',
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      await storage.erase();
      Get.offAllNamed(Routes.dashboard);
    } catch (e) {}
  }
}
