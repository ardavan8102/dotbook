import 'dart:io';
import 'package:epubx/epubx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class GetFileController extends GetxController {
  
  final Rx<File?> epubFile = Rx<File?>(null);
  final Rx<EpubBook?> book = Rx<EpubBook?>(null);
  final RxBool loading = false.obs;

  final RxInt openedChapterIndex = (-1).obs;

  Future<void> pickEpubFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['epub'],
    );

    if (result == null) return;
    epubFile.value = File(result.files.single.path!);
  }

  Future<void> openEpub() async {
    if (epubFile.value == null) return;

    loading.value = true;

    final bytes = await epubFile.value!.readAsBytes();
    book.value = await EpubReader.readBook(bytes);

    openedChapterIndex.value = -1; // reset
    loading.value = false;
  }

  void toggleChapter(int index) {
    if (openedChapterIndex.value == index) {
      openedChapterIndex.value = -1;
    } else {
      openedChapterIndex.value = index;
    }
  }
}