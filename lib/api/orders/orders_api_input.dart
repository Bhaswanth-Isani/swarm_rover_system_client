import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_api_input.freezed.dart';
part 'orders_api_input.g.dart';

@freezed
class GetItemsInput with _$GetItemsInput {
  const factory GetItemsInput({
    required String hotelId,
  }) = _GetItemsInput;

  factory GetItemsInput.fromJson(Map<String, Object?> json) =>
      _$GetItemsInputFromJson(json);
}

@freezed
class UpdateOrderInput with _$UpdateOrderInput {
  const factory UpdateOrderInput({
    required String itemId,
  }) = _UpdateOrderInput;

  factory UpdateOrderInput.fromJson(Map<String, Object?> json) =>
      _$UpdateOrderInputFromJson(json);
}
