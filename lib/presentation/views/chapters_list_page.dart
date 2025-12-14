import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/controllers/chapters_page_controller.dart';
import 'package:dotbook/presentation/views/chapter_content_page.dart';
import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/loading_circle.dart';
import 'package:epubx/src/entities/epub_chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaptersListPage extends StatelessWidget {
  final String bookPath;

  const ChaptersListPage({super.key, required this.bookPath});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChaptersController(bookPath));

    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'Chapters'),
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return LoadingSpinningLines(text: 'Loading Chapters');
          }
        
          if (controller.error.value != null) {
            return Center(
              child: Text(
                controller.error.value!,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        
          final chapters = controller.chapters;
        
          if (chapters.isEmpty) {
            return const Center(child: Text('No Book Founded'));
          }
        
          return chaptersListView(chapters);
        }),
      ),
    );
  }

  ListView chaptersListView(List<EpubChapter> chapters) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final chapter = chapters[index];

        return chapterListViewTile(chapter);
      },
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemCount: chapters.length,
    );
  }

  ListTile chapterListViewTile(EpubChapter chapter) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
        side: BorderSide(width: 1, color: Colors.grey.shade300)
      ),
      tileColor: Colors.grey.shade100,
      title: Text(
        chapter.Title ?? "No Title",
        style: const TextStyle(fontSize: 16, fontWeight: .w600, color: AppSolidColors.secondary),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Get.to(() => ChapterContentPage(chapter: chapter));
      },
    );
  }
}
