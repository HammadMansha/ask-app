import 'dart:convert';

import 'package:ask/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../model/post_model.dart';
import '../../model/userProfile_model.dart';

class UserProfileController extends GetxController {
  bool isLoading = true;

  int tapFunction = 0;

  UserProfile? userProfile;
  UserProfile? loggedUser;
  DashboardController dashboardController = Get.find<DashboardController>();
  final storage = GetStorage();
  TextEditingController report = TextEditingController();

  String userId = '';
  List<Posts> questionPosts = [];
  List<Posts> answerPosts = [];
  List savePost = [];

  @override
  void onInit() async {
    if (Get.arguments != null) {
      userId = Get.arguments;
      update();
      await getSingleUser(Get.arguments);
    }
    super.onInit();
  }

  @override
  void onReady() async {
    await getLoggedUser();
    await getQuestionUser();
    await getAnswerUser();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getLoggedUser() async {
    try {
      String token = await storage.read('access_token');
      var res = await http.post(
          Uri.parse(
            ApiData.baseUrl + ApiData.userProfilebyId,
          ),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': dashboardController.user!.id
          });
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      print('check datalogged $data');
      if (statusCode >= 200 || statusCode <= 300) {
        loggedUser = UserProfile.fromJson(data);
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

  Future<void> getSingleUser(String uid) async {
    try {
      print('call $uid');
      String token = await storage.read('access_token');
      var res = await http.post(
          Uri.parse(
            ApiData.baseUrl + ApiData.userProfilebyId,
          ),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': uid
          });
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      print('check data $data');
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

  Future<void> followUser() async {
    try {
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
        Uri.parse(
          ApiData.baseUrl + ApiData.followUser,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {'userId': userId},
      );
      var d = json.decode(res.body);
      print("check $d");
      if (res.statusCode >= 200 || res.statusCode <= 300) {
        dashboardController.isLoading = true;
        dashboardController.update();
        await getLoggedUser();
        await dashboardController.getSingleUser();
        dashboardController.isLoading = false;
        dashboardController.update();
        isLoading = false;
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

  Future<void> unfollowUser() async {
    try {
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
        Uri.parse(
          ApiData.baseUrl + ApiData.unfollowUser,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {'userId': userId},
      );
      var d = json.decode(res.body);
      print("check $d");
      if (res.statusCode >= 200 || res.statusCode <= 300) {
        dashboardController.isLoading = true;
        dashboardController.update();
        await getLoggedUser();
        await dashboardController.getSingleUser();
        dashboardController.isLoading = false;
        dashboardController.update();
        isLoading = false;
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

  bool isFollow() {
    if (loggedUser!.following != null) {
      for (var element in loggedUser!.following!) {
        if (element.id == userId) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> getQuestionUser() async {
    try {
      questionPosts.clear();
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
          Uri.parse(
            ApiData.baseUrl + ApiData.getQuestionById,
          ),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': userId
          });
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 && statusCode <= 300) {
        data['results'].forEach((e) {
          questionPosts.add(Posts.fromJson(e));
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

  Future<void> getAnswerUser() async {
    try {
      answerPosts.clear();
      update();
      String token = await storage.read('access_token');
      var res = await http.post(
          Uri.parse(
            ApiData.baseUrl + ApiData.getAnswerById,
          ),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'id': userId
          });
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 && statusCode <= 300) {
        data['results'].forEach((e) {
          answerPosts.add(Posts.fromJson(e));
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
    print("check data is ${dashboardController.user!.id}");
    print("check data $likesList");

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
