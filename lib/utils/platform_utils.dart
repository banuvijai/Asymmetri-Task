import 'imports.dart';

class PlatformUtils {
  static bool get isWeb => kIsWeb;

  static bool get isMobile {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  static bool get isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }

  static String get platformName {
    if (kIsWeb) return "Web";
    if (isMobile) return "Mobile";
    if (isDesktop) return "Desktop";
    return "Unknown";
  }
}

class ResponsiveUtils {
  static double getContentWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (PlatformUtils.isMobile) {
      return screenWidth * 0.6;
    } else if (PlatformUtils.isWeb) {
      return screenWidth * 0.24;
    } else {
      return screenWidth;
    }
  }
  static double getContentHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }
}

