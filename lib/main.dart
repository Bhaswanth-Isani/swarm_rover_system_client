import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/app.dart';
import 'package:swarm_rover_system_client/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  if (RunningPlatform.isDesktop) {
    // Runs only if the app is running either on Windows, MacOS or Linux.
    await desktopUIConfiguration();
  }

  runApp(
    ProviderScope(
      observers: [RiverpodObserver()],
      child: const App(),
    ),
  );
}
