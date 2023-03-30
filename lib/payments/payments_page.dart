import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';

class PaymentsPage extends ConsumerStatefulWidget {
  const PaymentsPage({super.key});

  @override
  ConsumerState<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends ConsumerState<PaymentsPage> {
  @override
  void initState() {
    super.initState();
    final orders = OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
        .getOrders('Bearer ${ref.read(authControllerProvider).admin!.token}');

    orders.then((value) => log(value.toJson().toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
