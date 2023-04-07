import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/controllers/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings/app_strings.dart';
import '../../utils/isLoading.dart';
import '../../widgets/common_textstyle/common_text_style.dart';

class NotificationAlertScreen extends StatelessWidget {
  const NotificationAlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyData(context);
  }

  Widget bodyData(context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (_) {
        return _.isLoading
            ? const Loading()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.noheading,
                        style: CommonTextStyle.style2,
                      ),
                    ).marginOnly(left: 25, right: 25),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _.notificationList.isEmpty
                        ? const Center(
                            child: Text(
                              'No Notification Found',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _.notificationList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (c, i) {
                              return notificationBody(
                                  message: _.notificationList[i]['subject']);
                            },
                          ).marginOnly(top: 10.0),
                  ],
                ),
              );
      },
    );
  }

  Widget notificationBody({Color? tileColor, String? message}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      tileColor: tileColor ?? const Color(0xffFFFFFF).withOpacity(0.6),
      title: Text(
        '$message',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xff1E1E1E),
        ),
      ),
      leading: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color:
              tileColor != null ? const Color(0xff8BDAA2) : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ).marginOnly(top: 15.0, left: 20.0),
      subtitle: const Text(
        '1m ago',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Color(0xffA1A1A1),
        ),
      ),
      trailing: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(
              AppAssets.avatar,
            ),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(23.0),
          border: Border.all(color: AppColors.textFieldBorderColor),
        ),
      ),
    );
  }
}
