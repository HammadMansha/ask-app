import 'dart:convert';

import 'package:ask/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../model/post_model.dart';

class DetailController extends GetxController {
  TextEditingController typeQuestion = TextEditingController();

  bool isLoading = true;
  final storage = GetStorage();
  Posts? posts;
  String id = '';

  @override
  void onInit() async {
    if (Get.arguments != null) {
      print("check arrg ${Get.arguments}");
      id = Get.arguments;
      update();
      await getFollowersPosts(Get.arguments);
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
    super.onClose();
  }

  Future<void> getFollowersPosts(String id) async {
    try {
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse('${ApiData.baseUrl}${ApiData.post}/$id'),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      Get.log('check Data $data');
      if (statusCode >= 200 && statusCode <= 300) {
        posts = Posts.fromJson(data);
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

  Future<void> writeComment() async {
    try {
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
        Uri.parse(ApiData.baseUrl + ApiData.writecomment),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        body: json.encode({
          'postId': id,
          'body': typeQuestion.text,
          'mentions': [],
        }),
      );
      if (res.statusCode >= 200 && res.statusCode <= 300) {
        await getFollowersPosts(id);
        typeQuestion.clear();
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar('Success', 'Comment send.', Colors.green);
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      print('chekc error ${e.toString()}');
      isLoading = false;
      update();
    }
  }

  Future<void> deleteComment(String cid) async {
    try {
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
        Uri.parse(ApiData.baseUrl + ApiData.deletecomment),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        body: json.encode({
          'postId': id,
          'commentId': cid,
        }),
      );
      if (res.statusCode >= 200 && res.statusCode <= 300) {
        await getFollowersPosts(id);
        typeQuestion.clear();
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar('Success', 'Comment deleted.', Colors.green);
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      print('chekc error ${e.toString()}');
      isLoading = false;
      update();
    }
  }
}
