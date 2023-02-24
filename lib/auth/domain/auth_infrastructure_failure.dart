import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_client/core/core.dart';

part 'auth_infrastructure_failure.freezed.dart';

@freezed

/// Contains all the infrastructure failures associated with Auth such as
/// - userAlreadyExists
/// - invalidCredentials
class AuthInfrastructureFailure extends InfrastructureFailure
    with _$AuthInfrastructureFailure {
  /// AuthInfrastructureFailure which represents that the email provider for
  /// creating account already used.
  const factory AuthInfrastructureFailure.userAlreadyExists() =
      UserAlreadyExists;

  /// AuthInfrastructureFailure which represents that either email or password
  /// is wrong.
  const factory AuthInfrastructureFailure.invalidCredentials() =
      InvalidCredentials;
}
