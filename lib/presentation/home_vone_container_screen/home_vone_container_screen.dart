import 'package:flutter/material.dart';
import 'package:revive/presentation/complete_your_plan_container1_page/complete_your_plan_container1_page.dart';
import 'package:revive/routes/app_routes.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_vone_tab_container_page/home_vone_tab_container_page.dart';
import '../profile_page/profile_page.dart';

class HomeVoneContainerScreen extends StatelessWidget {
  HomeVoneContainerScreen({Key? key})
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
          initialRoute: AppRoutes.homeVoneTabContainerPage,
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
        return AppRoutes.homeVoneTabContainerPage;
      case BottomBarEnum.Revive:
        return AppRoutes.completeYourPlanContainer1Page;
      case BottomBarEnum.Report:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeVoneTabContainerPage:
        return HomeVoneTabContainerPage();
      case AppRoutes.completeYourPlanContainer1Page:
        return CompleteYourPlanContainer1Page();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return Container(
          child: Text("hello"),
        );
    }
  }
}
