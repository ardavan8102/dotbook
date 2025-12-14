import 'package:dotbook/core/controllers/file_library_controller.dart';
import 'package:get/get.dart';

class LibraryPageBindings implements Bindings {

  @override
  void dependencies(){
    Get.put(FileLibraryController());
  }

}