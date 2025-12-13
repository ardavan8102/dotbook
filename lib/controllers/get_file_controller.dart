import 'dart:io';
import 'package:epubx/epubx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class GetFileController extends GetxController {
  
  final Rx<File?> epubFile = Rx<File?>(null);
  final Rx<EpubBook?> book = Rx<EpubBook?>(null);
  final RxBool loading = false.obs;

  Future<void> pickEpubFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['epub'],
    );

    if (result == null) return;

    epubFile.value = File(result.files.single.path!);
  }

  Future<void> openEpub() async {
    final file = epubFile.value;
    if (file == null) return;

    loading.value = true;

    final bytes = await file.readAsBytes();
    final epubBook = await EpubReader.readBook(bytes);

    book.value = epubBook;
    loading.value = false;
  }
}
