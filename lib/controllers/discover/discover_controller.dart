import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';

class DiscoverScreenController extends GetxController {
  bool isLoading = true;

  int tapFunction = 0;

  @override
  void onInit() {
    // TODO: implement onInit
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
    // TODO: implement onClose
    super.onClose();
  }


  Future<void> getPosts() async {
    try {
      isLoading = true;
        update();
        var res = await http.get(
          Uri.parse(ApiData.baseUrl + ApiData.signIn),
        );
        print('check body ${res.body}');
        var statusCode = res.statusCode;
        var data = json.decode(res.body);
        if (statusCode >= 200 || statusCode <= 300) {
         
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
