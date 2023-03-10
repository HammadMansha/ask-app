import 'package:ask/constants/app_assets/app_assets.dart';
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:ask/routes/app_routes.dart';
import 'package:ask/utils/drawer.dart';
import 'package:ask/views/answer/answer.dart';
import 'package:ask/views/inbox/inbox_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../ask_question/ask_question.dart';
import '../discover/discover.dart';
import '../notification/notification.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.navigationQueue.isEmpty) {
              // return showWillPopMessage(context);
            }
            _.navigationQueue.removeLast();
            int position =
                _.navigationQueue.isEmpty ? 0 : _.navigationQueue.last;
            _.currentindex = position;
            _.update();
            return false;
          },
          child: Scaffold(
            key: _.scaffoldKey,
            appBar: AppBar(
              leading: _.currentindex == 0
                  ? GestureDetector(
                      onTap: () {
                        _.scaffoldKey.currentState!.openDrawer();
                      },
                      child: Image.asset(AppAssets.drawer),
                    )
                  : null,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: _.currentindex == 4 || _.currentindex == 2
                  ? []
                  : [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.profileScreen);
                        },
                        child: Image.asset(AppAssets.profilePic),
                      ),
                    ],
            ),
            drawer: _.currentindex == 0 ? const DrawerUtils() : null,
            extendBodyBehindAppBar: true,
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: _.currentindex == 4
                      ? [
                          Colors.white,
                          Colors.white,
                        ]
                      : [
                          AppColors.discoverBackgroundColor1,
                          AppColors.discoverBackgroundColor2
                        ],
                ),
              ),
              child: SafeArea(child: getBody(_)),
            ),
            bottomNavigationBar: bottomnavbar(_),
          ),
        );
      },
    );
  }

  Widget getBody(DashboardController _) {
    List<Widget> pages = [
      const DiscoverScreen(),
      const AnswerScreen(),
      const AskQuestionScreen(),
      const InboxScreen(),
      const NotificationScreen()
    ];
    return IndexedStack(
      index: _.currentindex,
      children: pages,
    );
  }

  Widget bottomnavbar(DashboardController _) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25.0,
          ),
          backgroundColor: Color(0xff85BAF8),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 25.0,
          ),
          backgroundColor: Color(0xff85BAF8),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          backgroundColor: Color(0xff85BAF8),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          backgroundColor: Color(0xff85BAF8),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          backgroundColor: Color(0xff85BAF8),
          label: '',
        ),
      ],
      currentIndex: _.currentindex,
      selectedItemColor: const Color(0xff22B161),
      selectedFontSize: 12.0,
      backgroundColor: Colors.white,
      unselectedItemColor: const Color(0xff85BAF8),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _.changeTabIndex,
    );
  }
}
