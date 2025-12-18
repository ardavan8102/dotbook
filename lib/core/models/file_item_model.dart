class FileItemModel {

  final String name;
  final String path;
  final int size;


  FileItemModel({
    required this.name,
    required this.path,
    required this.size,
  });


  String get sizeInMB =>
    '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';

}