class CleanPersianFile {

  static String cleanPersianSplit(String html) {
    var result = html;

    // delete BOM
    result = result.replaceFirst('\uFEFF', '');

    // delete 'unknown' strings
    result = result.replaceFirst(
      RegExp(r'^\s*(<[^>]+>)*\s*(unknown|UNKNOWN)\s*', caseSensitive: false),
      '',
    );

    // delete 'unknown' titles
    result = result.replaceAll(
      RegExp(r'<title>\s*unknown\s*</title>', caseSensitive: false),
      '',
    );

    // delete empty states
    result = result.replaceFirst(
      RegExp(r'^(<p>\s*</p>\s*)+'),
      '',
    );

    return result.trimLeft();
  }

}