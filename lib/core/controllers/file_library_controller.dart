import 'package:dotbook/core/models/scanned_epub_model.dart';
import 'package:dotbook/core/modules/file_isolate.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class FileLibraryController extends GetxController {
  final loading = false.obs;
  final books = <ScannedEpub>[].obs;

  @override
  void onInit() {
    super.onInit();
    scanLibrary();
  }

  Future<void> scanLibrary() async {
    loading.value = true;

    final result = await compute(
      scanEpubIsolate,
      '/storage/emulated/0/Download',
    );

    books.assignAll(result);
    loading.value = false;
  }
}
