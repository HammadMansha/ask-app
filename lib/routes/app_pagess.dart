
import 'package:ask/routes/app_routes.dart';
import 'package:ask/views/auth/forogt_password/forgot_password.dart';
import 'package:ask/views/auth/login/login.dart';
import 'package:ask/views/auth/signup/sign_up.dart';
import 'package:ask/views/auth/signup/signup2.dart';
import 'package:ask/views/auth/signup_or_login.dart';
import 'package:ask/views/dashboard/dashboard.dart';
import 'package:ask/views/drawer_items/editprofile.dart';
import 'package:ask/views/drawer_items/helpcenter.dart';
import 'package:ask/views/drawer_items/notification_setting.dart';
import 'package:ask/views/info/info.dart';
import 'package:ask/views/profile/profile.dart';
import 'package:get/get.dart';

import '../views/auth/forogt_password/otp_screen.dart';
import '../views/splash/splash_screen.dart';

class AppPages {
  static var initial = Routes.splash;
  static final routes = [
    // <------ Splash Routes --------->
    GetPage(
      name: Routes.splash,
      page: () =>  SplashScreen(),
    ),

    // <------ Signup or login Routes --------->
    GetPage(
      name: Routes.signupOrLogin,
      page: () => const SignupOrLogin(),
    ),
    // <------ Login Routes --------->
    GetPage(
      name: Routes.login,
      page: () => const Login(),
      // binding: LoginBinding(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      //
      // ],

    ),
    // <------ Sign up Routes --------->
    GetPage(
      name: Routes.signUp,
      page: () => const Signup(),
      // binding: SignUpBinding(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      //
      // ],
    ),

    // <------ Sign up screen 2 Routes --------->
    GetPage(
      name: Routes.signUpScreen2,
      page: () => const SignUpScreen2(),
      // binding: SignUpScreen2Binding(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      //
      // ],
    ),

    // <------ Forgot Password Routes --------->
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForogotPassword(),
      // binding: ForgotPasswordBinding(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),

      //],
    ),
    // <------ OTP screen Routes --------->
    GetPage(
      name: Routes.otp,
      page: () => const OTPScreen(),
      // binding: OTPScreenBindings(),
      // middlewares: [
      //   RouteWelcomeMiddleware(priority: 1),
      //
      // ],

    ),

    //-------------------------Notification Screen------------
    GetPage(
      name: Routes.dashboard,
      page: () => const Dashboard(),

    ),

    //-------------------------Edit Profile Screen------------
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileScreen(),
    ),

    //-------------------------Help Center Screen------------
    GetPage(
      name: Routes.helpCenter,
      page: () => const HelpCenterScreen(),
    ),

    //-------------------------Notifcation Setting Screen------------
    GetPage(
      name: Routes.notificationSettingScreen,
      page: () => const NotificationSettingScreen(),
    ),

    //------------------------- Profile Screen------------
    GetPage(
      name: Routes.profileScreen,
      page: () => const Profile(),
    ),

    //------------------------- Info Screen------------
    GetPage(
      name: Routes.infoScreen,
      page: () => const InfoScreen(),
    )

  ];
}
