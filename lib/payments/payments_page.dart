import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';
import 'package:swarm_rover_system_client/payments/payments_provider.dart';

class PaymentsPage extends ConsumerWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(paymentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff202020),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(orders!.items[index].itemName),
                        Text(orders.items[index].itemPrice.toString()),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: orders?.items.length ?? 0,
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: const Text('PAY')),
            ),
          ],
        ),
      ),
    );
  }
}
