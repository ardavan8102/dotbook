import 'package:dotbook/core/controllers/file_library_controller.dart';
import 'package:dotbook/presentation/views/chapters_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<FileLibraryController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        centerTitle: true,
      ),
      body: Obx((){
        if (controller.loading.value) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];

            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.author ?? 'Unknown Publisher'),
              onTap: () => Get.to(() => ChaptersListPage(bookPath: book.path)),
            );
          },
        );
      }),
    );
  }
}