import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';
import 'package:swarm_rover_system_client/dashboard/dashboard.dart';
import 'package:swarm_rover_system_client/payments/payments_page.dart';

part 'router.g.dart';

@TypedGoRoute<CreateAccountRoute>(path: '/create-account')
class CreateAccountRoute extends GoRouteData {
  const CreateAccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateAccountPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<DashboardRoute>(path: '/')
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

@TypedGoRoute<PaymentsRoute>(path: '/payments')
class PaymentsRoute extends GoRouteData {
  const PaymentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PaymentsPage();
}
