import 'package:dotbook/bindings.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/presentation/views/library_page.dart';
import 'package:get/get.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.library,
      page: () => LibraryPage(),
      binding: LibraryPageBindings()
    ),

  ];

}