import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/constants/app_strings/app_strings.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/common_textstyle/common_text_style.dart';

class DrawerUtils extends StatelessWidget {
  const DrawerUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(height: 200),
          ListTile(
            leading: Image.asset(
              AppAssets.person,
              width: 17.09,
              height: 16.49,
            ),
            onTap: () {
              Get.toNamed(Routes.editProfile);
            },
            title: Text(
              AppStrings.person,
              style: CommonTextStyle.style4,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 13,
            ),
          ),
          ListTile(
            leading: Image.asset(
              AppAssets.notification,
              height: 22,
              width: 22,
            ),
            title: Text(
              AppStrings.notification,
              style: CommonTextStyle.style4,
            ),
            onTap: () {
              Get.toNamed(Routes.notificationSettingScreen);
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 13,
            ),
          ),
          ListTile(
            leading: Image.asset(
              AppAssets.password,
              width: 17.09,
              height: 22.43,
            ),
            onTap: () {
              Get.toNamed(Routes.resetpasswordScreen);
            },
            title: Text(
              AppStrings.passwordSetting,
              style: CommonTextStyle.style4,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 13,
            ),
          ),
          ListTile(
            leading: Image.asset(
              AppAssets.help,
              height: 21.4,
              width: 21.4,
            ),
            onTap: () {
              Get.toNamed(Routes.helpCenter);
            },
            title: Text(
              AppStrings.helpCentre,
              style: CommonTextStyle.style4,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 13,
            ),
          ),
          ListTile(
            leading: Image.asset(
              AppAssets.colorfulAsk,
              height: 22,
              width: 22,
            ),
            title: Text(
              AppStrings.whatIsAsk,
              style: CommonTextStyle.style4,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 13,
            ),
          ),
        ],
      ),
    );
  }
}
