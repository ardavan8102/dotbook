import 'package:dotbook/controllers/get_file_controller.dart';
import 'package:dotbook/presentation/widgets/appbar.dart';
import 'package:dotbook/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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

          CustomElevatedButton(
            controller: controller.pickEpubFile,
            msg: 'Choose EPUB file',
          ),

          Obx(() {
            final file = controller.epubFile.value;
            if (file == null) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Text(file.path.split('/').last),
            );
          }),

          CustomElevatedButton(
            controller: controller.openEpub,
            msg: 'Open EPUB Book',
          ),

          const Divider(),

          Expanded(
            child: Obx(() {
              if (controller.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final book = controller.book.value;
              if (book == null) {
                return const Center(child: Text('select a EPUB file first'));
              }

              final chapters = book.Chapters ?? [];

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  if (chapter.HtmlContent == null) {
                    return const SizedBox();
                  }

                  return Obx(() {
                    final isOpen = controller.openedChapterIndex.value == index;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => controller.toggleChapter(index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    chapter.Title ?? 'No Title',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isOpen)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 24),
                            child: HtmlWidget(
                              '<body>${chapter.HtmlContent!}</body>',
                              textStyle: const TextStyle(
                                fontSize: 16,
                                height: 1.9,
                              ),
                              customStylesBuilder: (element) {
                                if (element.localName == 'p') {
                                  return {'text-align': 'justify'};
                                }
                                return null;
                              },
                            ),
                          ),
                      ],
                    );
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}