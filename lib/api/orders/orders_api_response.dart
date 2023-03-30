import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_api_response.freezed.dart';
part 'orders_api_response.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String itemName,
    required int itemPrice,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

@freezed
class ItemsResponse with _$ItemsResponse {
  const factory ItemsResponse({
    required bool success,
    required List<Item> items,
  }) = _ItemsResponse;

  factory ItemsResponse.fromJson(Map<String, Object?> json) =>
      _$ItemsResponseFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required List<Item> items,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class OrdersResponse with _$OrdersResponse {
  const factory OrdersResponse({
    required bool success,
    required Order orders,
  }) = _OrdersResponse;

  factory OrdersResponse.fromJson(Map<String, Object?> json) =>
      _$OrdersResponseFromJson(json);
}
