import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isLoading = true;

  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    isLoading = false;
    super.onReady();
  }
}
