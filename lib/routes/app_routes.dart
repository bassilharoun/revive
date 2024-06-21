import 'package:flutter/material.dart';
import 'package:revive/presentation/complete_your_plan_container1_page/complete_your_plan_container1_page.dart';
import 'package:revive/presentation/get_ready/get_ready_screen.dart';
import 'package:revive/presentation/home_vone_container_screen/home_vone_container_screen.dart';
import 'package:revive/presentation/live_excercise/live_excercise.dart';
import 'package:revive/presentation/on_bording/on_boarding_screen.dart';
import 'package:revive/presentation/reports_screen/reports_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/program_screen/program_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String programScreen = '/program_screen';

  static const String completeYourPlanContainer1Page =
      '/complete_your_plan_container1_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String homeVonePage = '/home_vone_page';

  static const String homeScreen = '/home_screen';

  static const String appHolder = '/home_vone_container_screen';

  static const String profilePage = '/profile_page';

  static const String reportsScreen = '/reports_screen';

  static const String onBoardingScreen = '/on_boarding_screen';

  static const String getReadyScreen = '/get_ready_screen';

  static const String liveExcerciseScreen = '/live_excercise_screen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    programScreen: (context) => ProgramScreen(),
    completeYourPlanContainer1Page: (context) =>
        CompleteYourPlanContainer1Page(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => OnBoardingScreen(),
    signupScreen: (context) => SignupScreen(),
    appHolder: (context) => AppHolder(),
    onBoardingScreen: (context) => OnBoardingScreen(),
    getReadyScreen: (context) => GetReadyScreen(),
    liveExcerciseScreen: (context) => LiveExerciseScreen(),
    reportsScreen: (context) => ReportsScreen(),
  };
}
