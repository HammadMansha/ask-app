import 'dart:convert';

import 'package:ask/model/post_model.dart';
import 'package:ask/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';
import '../dashboard_controller.dart';

class DiscoverScreenController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  DashboardController dashboardController = Get.find<DashboardController>();

  TextEditingController report = TextEditingController();

  int tapFunction = 0;

  List<Posts> publicPosts = [];
  List<Posts> followersPosts = [];
  List savePost = [];

  @override
  void onReady() async {
    await getPublicPosts();
    await getFollowersPosts();
    await getSavePosts();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getPublicPosts() async {
    try {
      publicPosts.clear();
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse('${ApiData.baseUrl}${ApiData.post}?status=Public'),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 || statusCode <= 300) {
        data['results'].forEach((e) {
          publicPosts.add(Posts.fromJson(e));
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

  Future<void> getFollowersPosts() async {
    try {
      followersPosts.clear();
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.getFollowersPost),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 && statusCode <= 300) {
        data['results'].forEach((e) {
          followersPosts.add(Posts.fromJson(e));
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

  Future<int> likePosts(String id) async {
    String token = await storage.read('access_token');
    var res = await http.patch(
      Uri.parse(ApiData.baseUrl + ApiData.likePost + id),
      headers: {'Authorization': 'Bearer $token'},
    );
    var statusCode = res.statusCode;
    return statusCode;
  }

  Future<int> dislikePosts(String id) async {
    String token = await storage.read('access_token');
    var res = await http.patch(
      Uri.parse(ApiData.baseUrl + ApiData.dislikePost + id),
      headers: {'Authorization': 'Bearer $token'},
    );
    var statusCode = res.statusCode;
    return statusCode;
  }

  bool isLike(List likesList) {
    for (var element in likesList) {
      if (element['id'] == dashboardController.user!.id) {
        return true;
      }
    }
    return false;
  }

  Future<int> savePosts(String id) async {
    String token = await storage.read('access_token');
    var res = await http.post(Uri.parse(ApiData.baseUrl + ApiData.savePost),
        headers: {'Authorization': 'Bearer $token'}, body: {'postId': id});
    var statusCode = res.statusCode;
    return statusCode;
  }

  Future<int> unSavePosts(String id) async {
    String token = await storage.read('access_token');
    var res = await http.post(Uri.parse(ApiData.baseUrl + ApiData.unsavePost),
        headers: {'Authorization': 'Bearer $token'}, body: {'postId': id});
    var statusCode = res.statusCode;
    return statusCode;
  }

  bool isSave(String id) {
    for (var element in savePost) {
      if (element['id'] == id) {
        return true;
      }
    }
    return false;
  }

  Future<void> getSavePosts() async {
    try {
      savePost.clear();
      update();
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse(ApiData.baseUrl + ApiData.getSavePost),
        headers: {'Authorization': 'Bearer $token'},
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 && statusCode <= 300) {
        savePost.addAll(data);
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
