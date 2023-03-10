import 'package:get/get.dart';

class InfoController extends GetxController {
  String heading = '';

  @override
  void onInit() {
    if (Get.arguments != null) {
      heading = Get.arguments;
      update();
    }
    super.onInit();
  }
}
