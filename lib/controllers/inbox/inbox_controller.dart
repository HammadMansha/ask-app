import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../model/post_model.dart';

class InboxScreenController extends GetxController {
  int tapFunction = 0;

  int onTap = 0;
  TextEditingController answer = TextEditingController();
  final storage = GetStorage();

  bool isLoading = true;
  List<Posts> sendPost = [];
  List<Posts> recievedPost = [];

  @override
  void onReady() async {
    await getSendPosts();
    await getRecievedPosts();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getSendPosts() async {
    try {
      sendPost.clear();
      update();
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.sentPost),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      print("sent data $data");
      if (statusCode >= 200 || statusCode <= 300) {
        data['results'].forEach((e) {
          sendPost.add(Posts.fromJson(e));
        });
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

  Future<void> getRecievedPosts() async {
    try {
      recievedPost.clear();
      update();
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.recievedPost),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 || statusCode <= 300) {
        data['results'].forEach((e) {
          sendPost.add(Posts.fromJson(e));
        });
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
