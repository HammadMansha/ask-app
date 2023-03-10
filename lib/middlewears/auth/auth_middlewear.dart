// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../classes/abstract_classes/localstorage_class.dart';
import '../../routes/app_routes.dart';
class RouteWelcomeMiddleware extends GetMiddleware with LocalStorage{
  // priority this value the smaller the better
  @override
  int? priority = 0;
  GetStorage localStorage=GetStorage();

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
bool isAppOpen=    localStorage.read("isAppOpen");

    if (isAppOpen== false) {
      return null;
    } else if (isAppOpen == true) {
      return const RouteSettings(name:Routes.login);
    } else {
      return const RouteSettings(name: Routes.splash);
    }
  }
}