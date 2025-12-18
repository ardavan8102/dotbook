import 'dart:io';
import 'package:dotbook/core/helpers/get_storage_root.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanStorageController extends GetxController {

  RxInt pdfCount = 0.obs;
  RxInt epubCount = 0.obs;
  bool isPermissionGranted = false;


  @override
  void onInit() {
    super.onInit();
    _initScan();
  }


  Future<void> _initScan() async {

    await requestStoragePermission();

    if (isPermissionGranted) {
      await countFilesByExtension();
    }

  }


  Future<void> requestStoragePermission() async {

    final status = await Permission.manageExternalStorage.request();
    
    isPermissionGranted = status.isGranted;

    debugPrint('🔃 Permission status : $status');
  }


  Future<void> countFilesByExtension() async {

    if (isPermissionGranted) {

      final rootDir = await GetStorageRoot.getRootStorage();

      final files = rootDir.listSync(
        recursive: true,
        followLinks: false,
      );


      for (var file in files) {

        if (file is File) {
          if (file.path.toLowerCase().endsWith('.pdf')) {
            pdfCount.value++;
          } else if (file.path.toLowerCase().endsWith('.epub')){
            epubCount.value++;
          }
        }

      }

    } else {
      debugPrint('🔴 No Permission Granted');
    }

  }

}