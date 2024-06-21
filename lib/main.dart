import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revive/routes/app_routes.dart';
import 'package:revive/theme/theme_helper.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          theme: theme,
          title: 'Revive',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
