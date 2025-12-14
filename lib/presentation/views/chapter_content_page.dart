import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ChapterContentPage extends StatelessWidget {
  final EpubChapter chapter;
  const ChapterContentPage({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.Title ?? ''),
        centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: HtmlWidget(
            '<body>${chapter.HtmlContent ?? ''}</body>',
            textStyle: const TextStyle(fontSize: 16, height: 2),
          ),
        ),
      ),

    );
  }
}