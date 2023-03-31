import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';
import 'package:swarm_rover_system_client/payments/payments_provider.dart';
import 'package:swarm_rover_system_client/router/router.dart';

class PaymentsPage extends ConsumerStatefulWidget {
  const PaymentsPage({super.key});

  @override
  ConsumerState<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends ConsumerState<PaymentsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(paymentsProvider.notifier).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(paymentsProvider);
    var total = 0;

    for (var i = 0; i < (orders?.items.length ?? 0); i++) {
      total += orders?.items[i].itemPrice ?? 0;
    }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(total.toString()),
              ],
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
                      .deleteOrders(
                    ref.read(authControllerProvider).admin!.token,
                  );

                  DashboardRoute().go(context);
                },
                child: const Text('PAY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
