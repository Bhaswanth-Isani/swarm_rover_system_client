import 'dart:io';

import 'package:flutter/foundation.dart';

/// Contains getters for knowing the underlying platform.
class RunningPlatform {
  /// Returns true if the running platform is Android.
  static bool get isAndroid => Platform.isAndroid;

  /// Returns true if the running platform is iOS.
  static bool get isIOS => Platform.isIOS;

  /// Returns true if the running platform is Windows.
  static bool get isWindows => Platform.isWindows;

  /// Returns true if the running platform is MacOS.
  static bool get isMacOS => Platform.isMacOS;

  /// Returns true if the running platform is Linux.
  static bool get isLinux => Platform.isLinux;

  /// Returns true if the running platform is either Windows or MacOS or Linux.
  static bool get isDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Returns true if the running platform is either Android or iOS.
  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  /// Returns true if the app is running on the web.
  static bool get isWeb => kIsWeb;
}
