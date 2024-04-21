import 'package:flutter/material.dart';
import 'package:revive/presentation/home_vone_container_screen/home_vone_container_screen.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/complete_your_plan_container_screen/complete_your_plan_container_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/program_screen/program_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String programScreen = '/program_screen';

  static const String completeYourPlanContainerScreen =
      '/complete_your_plan_container_screen';

  static const String completeYourPlanContainer1Page =
      '/complete_your_plan_container1_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String homeVonePage = '/home_vone_page';

  static const String homeVoneTabContainerPage =
      '/home_vone_tab_container_page';

  static const String homeVoneContainerScreen = '/home_vone_container_screen';

  static const String profilePage = '/profile_page';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    programScreen: (context) => ProgramScreen(),
    completeYourPlanContainerScreen: (context) =>
        CompleteYourPlanContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    homeVoneContainerScreen: (context) => HomeVoneContainerScreen(),
  };
}
