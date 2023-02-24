import 'dart:ui';

import 'package:window_manager/window_manager.dart';

/// Styles the desktop window to remove title bar and fixes a minimum size
/// for the window.
Future<void> desktopUIConfiguration() async {
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    size: Size(1200, 600),
    center: true,
    titleBarStyle: TitleBarStyle.hidden,
    title: 'Patrio',
    minimumSize: Size(1200, 600),
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () {
    windowManager
      ..show()
      ..focus();
  });
}
