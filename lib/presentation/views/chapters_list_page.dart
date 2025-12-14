import 'package:dotbook/core/controllers/chapters_page_controller.dart';
import 'package:dotbook/presentation/views/chapter_content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaptersListPage extends StatelessWidget {

  final String bookPath;

  const ChaptersListPage({super.key, required this.bookPath});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ChaptersController(bookPath));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapters'),
        centerTitle: true,
      ),
      body: Obx((){

        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
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

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final chapter = chapters[index];

            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: .circular(12)
              ),
              tileColor: Colors.grey.shade100,
              title: Text(
                chapter.Title ?? "No Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: .w600,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.to(
                  () => ChapterContentPage(chapter: chapter)
                );
              },
            );
          },
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemCount: chapters.length
        );
      }),
    );
  }
}