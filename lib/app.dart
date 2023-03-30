import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';
import 'package:swarm_rover_system_client/router/router.dart';
import 'package:swarm_rover_system_client/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      routes: $appRoutes,
      debugLogDiagnostics: true,
      initialLocation: const PaymentsRoute().location,
      redirect: (context, state) {
        final authState =
            ref.watch(authControllerProvider.select((value) => value.admin));

        return authState == null
            ? state.location == const LoginRoute().location ||
                    state.location == const SplashRoute().location
                ? const LoginRoute().location
                : const CreateAccountRoute().location
            : const PaymentsRoute().location;
      },
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Patrio',
      theme: PatrioLightTheme().theme(),
      darkTheme: PatrioDarkTheme().theme(),
      routerConfig: router,
    );
  }
}
