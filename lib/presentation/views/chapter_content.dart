import 'package:dotbook/core/models/chapter_meta.dart';
import 'package:dotbook/features/load_chapter_data.dart';
import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/loading_circle.dart';
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

    chapterFuture = LoadChapterData.loadChapter(bookPath: bookPath, chapterIndex: chapter.index);
  }

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
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
              textStyle: textTheme.labelMedium,
            ),
          );
        },
      ),
    );
  }
}