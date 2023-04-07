import 'package:ask/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../dashboard_controller.dart';

class EditProfileController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  TextEditingController name = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController bio = TextEditingController();

  String profilePic = '';
  String coverPic = '';

  XFile? profileImage;
  XFile? coverImage;
  final ImagePicker imagePicker = ImagePicker();

  DashboardController dashboardController = Get.find<DashboardController>();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  void selectImage() async {
    final XFile? selectImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectImage != null) {
      profileImage = selectImage;
      update();
    }
  }

  void selectCoverImage() async {
    final XFile? selectImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectImage != null) {
      coverImage = selectImage;
      update();
    }
  }

  void getUser() {
    name.text = '${dashboardController.user!.firstName}';
    lname.text = '${dashboardController.user!.lastName}';
    username.text = '${dashboardController.user!.userName}';
    email.text = '${dashboardController.user!.email}';
    bio.text = '${dashboardController.user!.bio}';
    profilePic = dashboardController.user!.photoPath == null
        ? ''
        : dashboardController.user!.photoPath!;
    coverPic = dashboardController.user!.coverImage == null
        ? ''
        : dashboardController.user!.coverImage!;
    update();
  }

  Future<void> updateData() async {
    try {
      isLoading = true;
      update();
      String token = await storage.read('access_token');
      if (coverImage != null && profileImage == null) {
        var uri = Uri.parse(ApiData.baseUrl +
            ApiData.updateUser +
            dashboardController.user!.id!);
        var res = http.MultipartRequest('PATCH', uri)
          ..headers.addAll({
            'Authorization': 'Bearer $token',
          })
          ..fields['firstName'] = name.text
          ..fields['lastName'] = lname.text
          ..fields['bio'] = bio.text
          ..files.add(
            await http.MultipartFile.fromPath('coverImage', coverImage!.path),
          );
        var response = await res.send();
        var responseString = await response.stream.bytesToString();
        print('check Res $responseString');
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          dashboardController.isLoading = true;
          dashboardController.update();
          await dashboardController.getSingleUser();
          dashboardController.isLoading = false;
          dashboardController.update();
          getUser();
          isLoading = false;
          update();
          Get.back();
          CommonSnackbar.getSnackbar(
              "Success", "Profile Updated", Colors.green);
        } else {
          isLoading = false;
          update();
        }
      } else if (profileImage != null && coverImage == null) {
        var uri = Uri.parse(ApiData.baseUrl +
            ApiData.updateUser +
            dashboardController.user!.id!);
        var res = http.MultipartRequest('PATCH', uri)
          ..headers.addAll({
            'Authorization': 'Bearer $token',
          })
          ..fields['firstName'] = name.text
          ..fields['lastName'] = lname.text
          ..fields['bio'] = bio.text
          ..files.add(
            await http.MultipartFile.fromPath('photoPath', profileImage!.path),
          );
        var response = await res.send();
        var responseString = await response.stream.bytesToString();
        print('check Res $responseString');
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          dashboardController.isLoading = true;
          dashboardController.update();
          await dashboardController.getSingleUser();
          dashboardController.isLoading = false;
          dashboardController.update();
          getUser();
          isLoading = false;
          update();
          Get.back();
          CommonSnackbar.getSnackbar(
              "Success", "Profile Updated", Colors.green);
        } else {
          isLoading = false;
          update();
        }
      } else if (profileImage != null && coverImage != null) {
        var uri = Uri.parse(ApiData.baseUrl +
            ApiData.updateUser +
            dashboardController.user!.id!);
        var res = http.MultipartRequest('PATCH', uri)
          ..headers.addAll({
            'Authorization': 'Bearer $token',
          })
          ..fields['firstName'] = name.text
          ..fields['lastName'] = lname.text
          ..fields['bio'] = bio.text
          ..files.add(
            await http.MultipartFile.fromPath('photoPath', profileImage!.path),
          )
          ..files.add(
            await http.MultipartFile.fromPath('coverImage', coverImage!.path),
          );
        var response = await res.send();
        var responseString = await response.stream.bytesToString();
        print('check Res $responseString');
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          dashboardController.isLoading = true;
          dashboardController.update();
          await dashboardController.getSingleUser();
          dashboardController.isLoading = false;
          dashboardController.update();
          getUser();
          isLoading = false;
          update();
          Get.back();
          CommonSnackbar.getSnackbar(
              "Success", "Profile Updated", Colors.green);
        } else {
          isLoading = false;
          update();
        }
      } else {
        var res = await http.patch(
            Uri.parse(ApiData.baseUrl +
                ApiData.updateUser +
                dashboardController.user!.id!),
            headers: {
              'Authorization': 'Bearer $token'
            },
            body: {
              'firstName': name.text,
              'lastName': lname.text,
              'bio': bio.text,
            });
        var statusCode = res.statusCode;
        if (statusCode >= 200 && statusCode <= 300) {
          dashboardController.isLoading = true;
          dashboardController.update();
          await dashboardController.getSingleUser();
          dashboardController.isLoading = false;
          dashboardController.update();
          getUser();
          isLoading = false;
          update();
          Get.back();
          CommonSnackbar.getSnackbar(
              "Success", "Profile Updated", Colors.green);
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
