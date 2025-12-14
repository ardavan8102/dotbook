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
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              spacing: 12,
              children: [
                const CircularProgressIndicator(),
                const Text(
                  'Scanning your Device ...',
                  style: TextStyle(fontSize: 18, fontWeight: .bold),
                  textAlign: .center,
                ),
                const Text(
                  'Finding .epub files in storage',
                  style: TextStyle(fontSize: 14, fontWeight: .w400),
                  textAlign: .center
                ),
              ],
            )
          );
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