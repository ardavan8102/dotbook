import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/widgets.dart';

class GetStorageRoot {

  static Future<Directory> getRootStorage() async {

    final path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOAD
    );

    final storagePath = Directory(path);

    debugPrint('✅ storage path : $storagePath');

    return storagePath; // --> /storage/emulated/0/download

  }

}