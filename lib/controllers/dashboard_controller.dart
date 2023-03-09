import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {
  int currentindex = 0;
  ListQueue<int> navigationQueue = ListQueue();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeTabIndex(int index) {
    currentindex = index;

    if (index == currentindex) {
      navigationQueue.clear();
      navigationQueue.addLast(index);
      currentindex = index;
      update();
    }
    update();
  }
}
