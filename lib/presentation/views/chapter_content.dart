import 'dart:io';

import 'package:dotbook/consts/colors.dart';
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

  late Future<EpubChapter> chapterFuture;


  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map;
    bookPath = args['path'];
    chapter = args['chapter'];

    chapterFuture = _loadChapter();
  }

  Future<EpubChapter> _loadChapter() async {

    final bytes = await File(bookPath).readAsBytes();

    final book = await EpubReader.readBook(bytes);

    return book.Chapters![chapter.index];

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppSolidColors.lightBackGround,
      appBar: AppBarWithReturnIcon(title: chapter.title),
      body: FutureBuilder(
        future: chapterFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingSpinningLines();
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Failed to load chapter'));
          }

          final content = snapshot.data!.HtmlContent ?? '';

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