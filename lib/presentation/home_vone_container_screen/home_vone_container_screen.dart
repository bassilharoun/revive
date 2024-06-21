import 'package:flutter/material.dart';
import 'package:revive/presentation/complete_your_plan_container1_page/complete_your_plan_container1_page.dart';
import 'package:revive/presentation/live_excercise/live_excercise.dart';
import 'package:revive/presentation/program_screen/program_screen.dart';
import 'package:revive/presentation/reports_screen/reports_screen.dart';
import 'package:revive/routes/app_routes.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_screen/home_screen.dart';
import '../profile_page/profile_page.dart';

class AppHolder extends StatelessWidget {
  AppHolder({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homeScreen,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Revive:
        return AppRoutes.completeYourPlanContainer1Page;
      case BottomBarEnum.Report:
        return AppRoutes.reportsScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreen:
        return HomeVoneTabContainerPage();
      case AppRoutes.completeYourPlanContainer1Page:
        return CompleteYourPlanContainer1Page();
      case AppRoutes.profilePage:
        return ProfilePage();
      case AppRoutes.liveExcerciseScreen:
        return LiveExerciseScreen();

      case AppRoutes.reportsScreen:
        return ReportsScreen();
      case AppRoutes.programScreen:
        return ProgramScreen();
      default:
        return Container(
          child: Center(child: Text("Page not found")), // Updated default case
        );
    }
  }
}
