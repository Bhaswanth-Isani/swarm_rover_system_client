import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_input.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_response.dart';
import 'package:swarm_rover_system_client/auth/application/auth_controller.dart';

final paymentsProvider =
    StateNotifierProvider<PaymentsProvider, Order?>(PaymentsProvider.new);

class PaymentsProvider extends StateNotifier<Order?> {
  PaymentsProvider(this.ref) : super(null) {
    getOrders();
  }

  final Ref ref;

  Future<void> getOrders() async {
    state = (await OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
            .getOrders(
      'Bearer ${ref.read(authControllerProvider).admin!.token}',
    ))
        .order;
  }

  Future<void> updateOrder(String itemId) async {
    state = (await OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
            .updateOrder(
      'Bearer ${ref.read(authControllerProvider).admin!.token}',
      UpdateOrderInput(itemId: itemId),
    ))
        .order;
  }
}
