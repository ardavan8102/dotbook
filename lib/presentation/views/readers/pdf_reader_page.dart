
import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:flutter/material.dart';

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

  int? pages = 0;
  int? currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturnIcon(title: widget.fileName),
      body: Text('Test'),
    );
  }
}
