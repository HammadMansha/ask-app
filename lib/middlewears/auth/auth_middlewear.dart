// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class IsLoggedMiddleware extends GetMiddleware {

  final storage = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    return storage.hasData('access_token') ? null : const RouteSettings(name: Routes.signupOrLogin);
  }
}