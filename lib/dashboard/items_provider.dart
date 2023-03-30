import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_response.dart';

final itemsProvider =
    StateNotifierProvider<ItemsProvider, List<Item>>((ref) => ItemsProvider());

class ItemsProvider extends StateNotifier<List<Item>> {
  ItemsProvider() : super([]) {
    getItems();
  }

  Future<void> getItems() async {
    state = (await OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
            .getItems())
        .items;
  }
}
