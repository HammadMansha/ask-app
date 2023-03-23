
import 'package:ask/routes/app_routes.dart';
import 'package:ask/views/answer/searchCategory.dart';
import 'package:ask/views/ask_question/askquestion_user.dart';
import 'package:ask/views/auth/forogt_password/forgot_password.dart';
import 'package:ask/views/auth/forogt_password/password.dart';
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
import 'package:ask/views/profile/userProfile.dart';
import 'package:ask/views/resetpassword/restpassword.dart';
import 'package:get/get.dart';
import '../views/auth/forogt_password/otp_screen.dart';
import '../views/notification/notification.dart';
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

    ),
    // <------ Sign up Routes --------->
    GetPage(
      name: Routes.signUp,
      page: () => const Signup(),
    ),

    // <------ Sign up screen 2 Routes --------->
    GetPage(
      name: Routes.signUpScreen2,
      page: () => const SignUpScreen2(),
    ),

    // <------ Forgot Password Routes --------->
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForogotPassword(),
    ),


    // <------ OTP screen Routes --------->
    GetPage(
      name: Routes.otp,
      page: () => const OTPScreen(),

    ),

    //-------------------------Notification Screen------------
    GetPage(
      name: Routes.dashboard,
      page: () => const Dashboard(),
      // middlewares: [
      //   IsLoggedMiddleware(),
      // ]

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
    ),

    //------------------------- Reset Password Screen------------
    GetPage(
      name: Routes.resetpasswordScreen,
      page: () => const ResetPassword(),
    ),

    //------------------------- Reset Password Screen------------
    GetPage(
      name: Routes.resetpasswordScreen,
      page: () => const ResetPassword(),
    ),


    //------------------------- Password Screen------------
    GetPage(
      name: Routes.passwordScreen,
      page: () => const Password(),
    ),


    //------------------------- User Profile Screen------------
    GetPage(
      name: Routes.userprofile,
      page: () => const UserProfile(),
    ),

    //------------------------- Ask Question User Screen------------
    GetPage(
      name: Routes.askquestionUser,
      page: () => const AskQuestionUserScreen(),
    ),

    //------------------------- Ask Question User Screen------------

    GetPage(
      name: Routes.notificationPermission,
      page: () => const NotificationScreen(),
    ),


    //------------------------- Search Category Screen------------
    
    GetPage(
      name: Routes.searchCategory,
      page: () => const SearchCategoryScreen(),
    ),

  ];
}
