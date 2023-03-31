import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_input.dart';
import 'package:swarm_rover_system_client/api/orders/orders_api_response.dart';

part 'orders_api_client.g.dart';

@RestApi()
abstract class OrdersApiClient {
  factory OrdersApiClient(Dio dio, {required String baseUrl}) =
      _OrdersApiClient;

  @GET('/auth/orders')
  @Headers({'Content-Type': 'application/json'})
  Future<OrdersResponse> getOrders(@Header('authorization') String auth);

  @GET('/hotel/get-items')
  @Headers({'Content-Type': 'application/json'})
  Future<ItemsResponse> getItems({
    @Body() GetItemsInput getItemsInput =
        const GetItemsInput(hotelId: '63fa60d7593aa1597b7d9697'),
  });

  @DELETE('auth/order')
  @Headers({'Content-Type': 'application/json'})
  Future<DeleteResponse> deleteOrders(@Header('authorization') String auth);

  @PATCH('/auth/update-order')
  @Headers({'Content-Type': 'application/json'})
  Future<OrdersResponse> updateOrder(
    @Header('authorization') String auth,
    @Body() UpdateOrderInput item,
  );
}
