import 'package:dotbook/core/controllers/scan_storage_controller.dart';
import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/cards/file_center_card_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileCenterPage extends StatelessWidget {
  FileCenterPage({super.key});


  final ScanStorageController storageController = Get.put(ScanStorageController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'File Center'),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                spacing: 20,
                children: [
                  Expanded(
                    child: Obx(
                      () => CardBoxWithIconItem(
                        size: size,
                        textTheme: textTheme,
                        icon: CupertinoIcons.book,
                        label: 'EPUB',
                        subtext: '${storageController.epubCount.value} files',
                        function: () {
                          
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: Obx(
                      () => CardBoxWithIconItem(
                        size: size,
                        textTheme: textTheme,
                        icon: CupertinoIcons.bookmark,
                        label: 'PDF',
                        subtext: '${storageController.pdfCount.value} files',
                        function: () {
                          
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}