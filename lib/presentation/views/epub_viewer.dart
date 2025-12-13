import 'package:dotbook/controllers/get_file_controller.dart';
import 'package:dotbook/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpubReaderPage extends StatelessWidget {
  const EpubReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetFileController());

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: controller.pickEpubFile,
            child: const Text('انتخاب فایل EPUB'),
          ),

          Obx(() {
            final file = controller.epubFile.value;
            if (file == null) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Text(file.path.split('/').last),
            );
          }),

          ElevatedButton(
            onPressed: controller.openEpub,
            child: const Text('باز کردن کتاب'),
          ),

          const Divider(),

          Expanded(
            child: Obx(() {
              if (controller.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.book.value == null) {
                return const Center(child: Text('کتابی باز نشده'));
              }

              final chapters = controller.book.value!.Chapters ?? [];

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  if (chapter.HtmlContent == null) return const SizedBox();

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      chapter.Title ?? 'بدون عنوان',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}