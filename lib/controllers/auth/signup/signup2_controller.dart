import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../api/api.dart';

class SignUp2Controller extends GetxController {
  bool isLoading = true;

  final storage = GetStorage();

  TextEditingController firstName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.text = Get.arguments;
      update();
    }
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> signUpFun() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        update();
        var res = await http.post(
          Uri.parse(ApiData.baseUrl + ApiData.signIn),
          body: {
            "firstName": firstName.text,
            "lastName": lastName.text,
            "email": email.text,
            "password": password.text,
            "userName": userName.text
          },
        );
        var statusCode = res.statusCode;
        // var data = json.decode(res.body);
        if (statusCode >= 200 || statusCode <= 300) {
          Get.back();
          Get.back();
        } else {
          isLoading = false;
          update();
        }
      }
    } catch (e) {
      isLoading = false;
      update();
    }
  }
}
