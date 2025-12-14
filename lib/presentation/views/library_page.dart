import 'package:dotbook/core/controllers/file_library_controller.dart';
import 'package:dotbook/core/models/scanned_epub_model.dart';
import 'package:dotbook/presentation/views/chapters_list_page.dart';
import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FileLibraryController());

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'Library'),
      body: Obx((){
        if (controller.loading.value) {
          return LoadingSpinningLines(text: 'Scanning your Device ...');
        }

        return ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];

            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: libraryListViewTile(book, textTheme),
            );
          },
        );
      }),
    );
  }

  ListTile libraryListViewTile(ScannedEpub book, TextTheme texTheme) {
    return ListTile(
      tileColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(10),
        side: BorderSide(
          width: 1,
          color: Colors.grey.shade300
        )
      ),
      title: Text(book.title),
      subtitle: Text(
        book.author != null ? 'Written by ${book.author}' : 'Unknown Publisher',
        style: texTheme.labelSmall,
      ),
      onTap: () => Get.to(() => ChaptersListPage(bookPath: book.path)),
      trailing: Icon(Icons.chevron_right),
    );
  }
}