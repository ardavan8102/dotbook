import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ChapterContentPage extends StatelessWidget {
  final EpubChapter chapter;
  const ChapterContentPage({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturnIcon(title: chapter.Title ?? 'Unknown Chapter'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: HtmlWidget(
            '<body>${cleanChapterHtml(chapter.HtmlContent!)}</body>',
            textStyle: const TextStyle(fontSize: 16, height: 2),
          ),
        ),
      ),

    );
  }

  // Remove single chapter number count from content
  String cleanChapterHtml(String html) {
    return html
    .replaceAllMapped(
      RegExp(r'<(p|span|div|h\d)[^>]*>\s*\d+\s*</\1>', caseSensitive: false),
      (_) => '',
    );
  }
}