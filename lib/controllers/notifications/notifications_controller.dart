import 'package:get/get.dart';

class NotificationController extends GetxController {
  bool isLoading = true;

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }
}