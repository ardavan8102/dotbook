import 'dart:io';

import 'package:dotbook/helpers/clean_persian_file.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';

class LoadChapterData {

  static Future<String> loadChapter({
    required String bookPath,
    required int chapterIndex,
  }) async {

    final bytes = await File(bookPath).readAsBytes();

    final book = await EpubReader.readBook(bytes);

    final chapterHtmlFiles = book.Content?.Html ?? {};

    if (chapterHtmlFiles.isEmpty) return '';

    late List<MapEntry<String, EpubTextContentFile>> chapters;

    final isBookPersian = chapterHtmlFiles.keys.where(
      (key) => key.contains('index_split')
    ).toList().isEmpty ? false : true;

    if (!isBookPersian) {

      debugPrint('🟡 English File');

      chapters = chapterHtmlFiles.entries
        .where(
          (entry) => entry.key.endsWith('.html') &&
          !entry.key.contains('titlepage')
        ).toList();

      if (chapterIndex < 0 || chapterIndex >= chapters.length) {
        return '';
      }

      final file = chapters[chapterIndex - 2].value;
      return file.Content!;
      

    } else {

      debugPrint('🔴 Persian File');

      chapters = chapterHtmlFiles.entries.where((entry) => entry.key.contains('.html')).toList();

      final chapterSplits = chapters..sort((a, b) => a.key.compareTo(b.key));
      

      final buffer = StringBuffer();

      for (final part in chapterSplits) {
        final cleanedContent = CleanPersianFile.cleanPersianSplit(part.value.Content!);
        buffer.write(cleanedContent);
      }

      return buffer.toString();

    }
    
  }

}