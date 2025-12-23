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
  void onReady() {
    super.onReady();

    ever(isPermissionGranted.obs, (_){
      if (isPermissionGranted) {
        countFilesByExtension();
      }
    });
  }

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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      _openSettingsDialog();
    }
  }


  void _openSettingsDialog() {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text('دسترسی نیاز است'),
        content: const Text(
          'برای اسکن فایل‌ها، لطفاً دسترسی حافظه را از تنظیمات فعال کنید.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('لغو'),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('رفتن به تنظیمات'),
            onPressed: () async {
              Get.back();
              await openAppSettings();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
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

            // get file name
            final fileName = file.path.split('/').last;

            // ignore ".trashed" files for final list
            if (!fileName.startsWith('.trashed')) {
              epubCount.value++;
            }

          }
        }

      }

    } else {
      debugPrint('🔴 No Permission Granted');
    }

  }

}