import 'dart:collection';
import 'dart:convert';
import 'package:ask/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';

class DashboardController extends GetxController {
  int currentindex = 0;
  ListQueue<int> navigationQueue = ListQueue();

  bool isLoading = true;

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
      isLoading = true;
      update();
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.singleUser),
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
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
}
