import 'dart:io';
import 'package:dotbook/core/helpers/get_storage_root.dart';
import 'package:dotbook/core/models/file_item_model.dart';
import 'package:get/get.dart';

class PdfFilesController extends GetxController {

  RxList<FileItemModel> pdfFiles = <FileItemModel>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    loadPdfFiles();
  }


  Future<void> loadPdfFiles() async {

    isLoading.value = true;

    pdfFiles.clear();

    final rootDir = await GetStorageRoot.getRootStorage();

    final dir = Directory(rootDir.path);

    for (final entity in dir.listSync(recursive: true)) {
      if ( entity is File && entity.path.toLowerCase().endsWith('.pdf') ) {

        final String fileName = entity.path.split('/').last; // --> /storage/emulated/0/Download/test.pdf ~~> test.pdf

        final String fileNameWithoutFormatLabel = fileName.split('.pdf').first; // --> test.pdf ~~> test |

        pdfFiles.add(
          FileItemModel(
            name: fileNameWithoutFormatLabel,
            path: entity.path,
            size: entity.lengthSync(),
          ),
        );
      }
    }

    isLoading.value = false;

  }

}