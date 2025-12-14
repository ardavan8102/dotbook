import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/presentation/views/library_page.dart';
import 'package:dotbook/presentation/views/splash.dart';
import 'package:get/get.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.library,
      page: () => LibraryPage(),
    ),

  ];

}