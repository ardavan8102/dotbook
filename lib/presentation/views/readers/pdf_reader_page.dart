import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfReaderPage extends StatefulWidget {
  const PdfReaderPage({
    super.key,
    required this.filePath,
    required this.fileName,
  });

  final String filePath;
  final String fileName;

  @override
  State<PdfReaderPage> createState() => _PdfReaderPageState();
}

class _PdfReaderPageState extends State<PdfReaderPage> {

  late PdfController _pdfController;
  final int _initPage = 1;

  int? currentPage;


  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.filePath),
      initialPage: _initPage
    );
  }


  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturnIcon(title: widget.fileName),
      body: PdfView(
        controller: _pdfController,
        builders: PdfViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          pageBuilder: _pageBuilder,
        ),
      ),
    );
  }


  PhotoViewGalleryPageOptions _pageBuilder(
    BuildContext context,
    Future<PdfPageImage> pageImage,
    int index,
    PdfDocument document,
  ) {
    return PhotoViewGalleryPageOptions(
      imageProvider: PdfPageImageProvider(
        pageImage,
        index,
        document.id
      ),
      minScale: PhotoViewComputedScale.contained * 1,
      maxScale: PhotoViewComputedScale.contained * 2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index')
    );
  }
}