import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../api/api.dart';
import '../../utils/snackbar.dart';

class AskQuestionUserontroller extends GetxController {
  TextEditingController typeQuestion = TextEditingController();
  TextEditingController location = TextEditingController();

  bool isLoading = true;
  String id = '';
  String name = '';

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  final storage = GetStorage();

  List locationList = [];

  @override
  void onInit() {
    if (Get.arguments != null) {
      id = Get.arguments['userId'];
      name = Get.arguments['userName'];
      update();
    }

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
      var uri = Uri.parse(ApiData.baseUrl + ApiData.directQuestion);
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(h);
      request.fields['body'] = typeQuestion.text;
      request.fields['location'] = location.text;
      request.fields['status'] = 'Private';
      request.fields['category'] = 'Direct';
      request.fields['to'] = id;
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
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        isLoading = false;
        typeQuestion.clear();
        location.clear();
        imageFileList.clear();
        update();
        CommonSnackbar.getSnackbar(
            'Success', 'Question send Successfully', Colors.green);
      } else {
        isLoading = false;
        update();
        CommonSnackbar.getSnackbar('Error', 'Server Error', Colors.red);
      }
    } catch (e) {
      isLoading = false;
      update();
      CommonSnackbar.getSnackbar('Error', e.toString(), Colors.red);
    }
  }
}
