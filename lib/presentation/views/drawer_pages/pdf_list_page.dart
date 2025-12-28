import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/core/controllers/file_controllers/pdf_files_controller.dart';
import 'package:dotbook/presentation/views/readers/pdf_reader_page.dart';
import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfListPage extends StatelessWidget {
  PdfListPage({super.key});

  final PdfFilesController pdfFilesController = Get.find<PdfFilesController>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'PDF Files'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Obx(
            () {
              
              if (pdfFilesController.isLoading.value) {
          
                return const Center(child: CircularProgressIndicator());
          
              }
              
              if (pdfFilesController.pdfFiles.isEmpty) {
                
                return const Center(child: Text('No Pdf file detected'));
          
              }
          
              return Center(
                child: ListView.builder(
                  itemCount: pdfFilesController.pdfFiles.length,
                  itemBuilder: (context, index) {
                    
                    final pdf = pdfFilesController.pdfFiles[index];

                    final isDark = Theme.of(context).brightness == Brightness.dark;
          
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => PdfReaderPage(
                            filePath: pdf.path,
                            fileName: pdf.name,
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark ? AppSolidColors.darkBorder : AppSolidColors.lightCreama,
                          borderRadius: .circular(12),
                          border: Border.all(
                            width: 1,
                            color: AppSolidColors.darkCreama,
                          )
                        ),
                        width: size.width,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          spacing: 12,
                          children: [
                            Text(
                              pdf.name,
                              textAlign: .center,
                              style: textTheme.labelLarge!.copyWith(
                                height: 1.8
                              ),
                            ),
                      
                            Text(
                              'Size : ${pdf.sizeInMB}',
                            ),
                          ],
                        ),
                      ),
                    );
          
                  },
                ),
              );
          
            }
          ),
        )
      ),
    );
  }
}