import 'package:dotbook/core/controllers/app_theme_controller.dart';
import 'package:dotbook/core/controllers/drawer_menu_controller.dart';
import 'package:dotbook/core/controllers/file_controllers/pdf_files_controller.dart';
import 'package:dotbook/core/controllers/file_controllers/scan_storage_controller.dart';
import 'package:dotbook/core/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(DrawerMenuController(), permanent: true);
    Get.put(AppThemeController(), permanent: true);
  }
}

class FileCenterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ScanStorageController(), permanent: true);
    Get.lazyPut(() => PdfFilesController());
  }
}