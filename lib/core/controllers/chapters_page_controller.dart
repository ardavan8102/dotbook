import 'package:dotbook/core/modules/file_isolate.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ChaptersController extends GetxController {
  final String epubPath;

  ChaptersController(this.epubPath);

  final loading = true.obs;
  final error = RxnString();

  late final EpubBook book;
  late final List<EpubChapter> chapters;

  @override
  void onInit() {
    super.onInit();
    loadBook();
  }

  Future<void> loadBook() async {
    try {
      loading.value = true;

      chapters = await compute(parseChaptersIsolate, epubPath);
    } catch (e) {
      error.value = 'Error in loading book';
    } finally {
      loading.value = false;
    }
  }
}
