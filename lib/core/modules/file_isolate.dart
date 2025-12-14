import 'dart:io';
import 'package:dotbook/core/models/scanned_epub_model.dart';
import 'package:epubx/epubx.dart';

Future<List<ScannedEpub>> scanEpubIsolate(String dirPath) async {
  final result = <ScannedEpub>[];

  final dir = Directory(dirPath);
  if (!dir.existsSync()) return result;

  final files = dir.listSync().whereType<File>().where(
    (f) => f.path.toLowerCase().endsWith('.epub'),
  );

  for (final file in files) {
    try {
      final bytes = file.readAsBytesSync();
      final book = await EpubReader.readBook(bytes);

      // Get Book Data
      final title = book.Title?.trim().isNotEmpty == true
          ? book.Title!
          : file.uri.pathSegments.last;
      final author = book.Author?.trim().isNotEmpty == true
          ? book.Author
          : null;

      result.add(
        ScannedEpub(
          path: file.path,
          title: title,
          author: author
        )
      );
    } catch (_) {}
  }

  return result;
}


Future<List<EpubChapter>> parseChaptersIsolate(String path) async {
  final bytes = File(path).readAsBytesSync();
  final book = await EpubReader.readBook(bytes);
  return book.Chapters ?? [];
}