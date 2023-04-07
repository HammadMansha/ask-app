import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../api/api.dart';

class NotificationController extends GetxController {
  bool isLoading = true;

  final storage = GetStorage();
  List notificationList = [];

  @override
  void onReady() async {
    await getNotification();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getNotification() async {
    try {
      String token = await storage.read('access_token');
      var res = await http.get(
        Uri.parse(
          ApiData.baseUrl + ApiData.getNotification,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var statusCode = res.statusCode;
      var data = json.decode(res.body);
      if (statusCode >= 200 || statusCode <= 300) {
        data['results'].forEach((e) {
          notificationList.add(e);
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
