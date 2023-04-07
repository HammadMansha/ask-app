import 'dart:io';

import 'package:ask/controllers/discover/discover_controller.dart';
import 'package:ask/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../api/api.dart';

class AskQuestionController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  TextEditingController typeQuestion = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController location = TextEditingController();

  DiscoverScreenController discoverScreenController =
      Get.find<DiscoverScreenController>();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  List categoryList = [];
  List locationList = [];

  @override
  void onInit() {
    categoryList = [
      {
        'id': '0',
        'name': 'Select Category',
      },
      {
        'id': 'Services',
        'name': 'Services',
      },
      {
        'id': 'Product',
        'name': 'Product',
      },
      {
        'id': 'Technologies',
        'name': 'Technologies',
      },
      {
        'id': 'Restaurants',
        'name': 'Restaurants',
      },
      {
        'id': 'ByAndSell',
        'name': 'Buying & Selling',
      },
      {
        'id': 'Others',
        'name': 'Others',
      },
    ];

    locationList = [
      {
        'id': '0',
        'name': 'Add Location',
      },
      {
        'id': 'jeddah',
        'name': 'Jeddah',
      },
      {
        'id': 'makkah',
        'name': 'Makkah',
      },
      {
        'id': 'medinah',
        'name': 'Medinah',
      },
      {
        'id': 'riyadh',
        'name': 'Riyadh',
      },
      {
        'id': 'nyc',
        'name': 'NYC',
      },
      {
        'id': 'london',
        'name': 'London',
      },
      {
        'id': 'amsterdam',
        'name': 'Amsterdam',
      },
      {
        'id': 'brussels',
        'name': 'Brussels',
      },
    ];
    update();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  void selectImage() async {
    final List<XFile> selectImage = await imagePicker.pickMultiImage();
    if (selectImage.isNotEmpty) {
      imageFileList.addAll(selectImage);
      update();
    }
  }

  Future<void> createPostWithImage() async {
    isLoading = true;
    update();
    try {
      String token = await storage.read('access_token');
      Map<String, String> h = {'Authorization': 'Bearer $token'};
      var uri = Uri.parse(ApiData.baseUrl + ApiData.post);
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(h);
      request.fields['body'] = typeQuestion.text;
      request.fields['location'] = location.text;
      request.fields['status'] = 'Public';
      request.fields['category'] = category.text;
      List<http.MultipartFile> newList = [];
      for (int i = 0; i < imageFileList.length; i++) {
        File imageFile = File(imageFileList[i].path.toString());
        var stream = http.ByteStream(imageFile.openRead())..cast();
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile("images", stream, length,
            filename: basename(imageFile.path));
        newList.add(multipartFile);
      }
      request.files.addAll(newList);
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      print('Check Response ${response.statusCode}');
      print('check Res $responseString');
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        discoverScreenController.isLoading = true;
        discoverScreenController.update();
        await discoverScreenController.getPublicPosts();
        await discoverScreenController.getFollowersPosts();
        discoverScreenController.isLoading = false;
        discoverScreenController.update();
        isLoading = false;
        typeQuestion.clear();
        location.clear();
        category.clear();
        imageFileList.clear();
        update();
        CommonSnackbar.getSnackbar(
            'Success', 'Post Create Successfully', Colors.green);
      } else {
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar('Error', 'Server Error', Colors.red);
      }
    } catch (e) {
      isLoading = false;
      update();
      print("check error ${e.toString()}");
      CommonSnackbar.getSnackbar('Error', e.toString(), Colors.red);
    }
  }


}
