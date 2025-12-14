import 'dart:io';

import 'package:dotbook/core/models/chapter_meta.dart';
import 'package:epubx/epubx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final RxBool loading = false.obs;

  String? bookPath;

  final RxList<ChapterMeta> chapters = <ChapterMeta>[].obs;

  // choose file
  Future<void> selectEpub() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['epub'],
    );

    if (result == null) return;

    bookPath = result.files.single.path;
    if (bookPath == null) return;

    await loadChapters();
  }

  // load chapters
  Future<void> loadChapters() async {
    loading.value = true;
    chapters.clear();

    final file = File(bookPath!);
    final bytes = await file.readAsBytes();

    final book = await EpubReader.readBook(bytes);

    for (int i = 0; i < book.Chapters!.length; i++) {
      chapters.add(
        ChapterMeta(
          title: book.Chapters![i].Title ?? 'Untitled',
          index: i,
        ),
      );
    }

    loading.value = false;
  }

  void read() {
    if (chapters.isEmpty) return;

    Get.snackbar('Read', 'Open chapter: ${chapters.first.title}');
  }
}
