import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_client/core/core.dart';

part 'auth_api_response.freezed.dart';
part 'auth_api_response.g.dart';

/// Response type for both create-account and login API routes in AuthApiClient.
@freezed
class UserApiResponse with _$UserApiResponse {
  const factory UserApiResponse({
    required bool success,
    required User? user,
    required String? token,
    required String? error,
  }) = _UserApiResponse;

  factory UserApiResponse.fromJson(Map<String, dynamic> json) =>
      _$UserApiResponseFromJson(json);
}
