import 'package:dotbook/bindings.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/presentation/views/home_screen.dart';
import 'package:dotbook/presentation/views/settings_page.dart';
import 'package:dotbook/presentation/views/splash.dart';
import 'package:get/get.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),

    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsPage(),
    ),

  ];

}