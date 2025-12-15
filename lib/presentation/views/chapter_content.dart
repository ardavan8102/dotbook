import 'dart:io';
import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/helpers/clean_persian_file.dart';
import 'package:dotbook/core/models/chapter_meta.dart';
import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/loading_circle.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class ChapterContentPage extends StatefulWidget {
  const ChapterContentPage({super.key});

  @override
  State<ChapterContentPage> createState() => _ChapterContentPageState();
}

class _ChapterContentPageState extends State<ChapterContentPage> {

  late final String bookPath;
  late final ChapterMeta chapter;

  late Future<String> chapterFuture;


  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map;
    bookPath = args['path'];
    chapter = args['chapter'];

    chapterFuture = _loadChapter(bookPath: bookPath, chapterIndex: chapter.index);
  }


  Future<String> _loadChapter({
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppSolidColors.lightBackGround,
      appBar: AppBarWithReturnIcon(title: chapter.title),
      body: FutureBuilder<String>(
        future: chapterFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingSpinningLines();
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Nothing to show!'));
          }

          final content = snapshot.data!;

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: HtmlWidget(
              content,
              textStyle: TextStyle(color: AppSolidColors.accent),
            ),
          );
        },
      ),
    );
  }
}