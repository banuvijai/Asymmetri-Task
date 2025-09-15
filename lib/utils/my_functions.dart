
class MyFunctions {
  static String formatListEntry(int index, String text) {
    return '$index. $text';
  }

  static String shortLink(String url) {
    return url.replaceFirst(RegExp(r'https?://'), '');
  }

  static bool looksLikeHttpUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }
}
