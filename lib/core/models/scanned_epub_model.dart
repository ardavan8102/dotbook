class ScannedEpub {
  final String path;
  final String title;
  final String? author;

  ScannedEpub({
    required this.path,
    required this.title,
    this.author,
  });
}
