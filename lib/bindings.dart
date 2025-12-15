import 'package:dotbook/core/controllers/drawer_menu_controller.dart';
import 'package:dotbook/core/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(DrawerMenuController(), permanent: true);
  }
}