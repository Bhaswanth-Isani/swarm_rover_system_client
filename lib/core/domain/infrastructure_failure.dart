import 'package:freezed_annotation/freezed_annotation.dart';

part 'infrastructure_failure.freezed.dart';

/// Parent class for all infrastructure failures such as
/// - CoreInfrastructureFailure
/// - AuthInfrastructureFailure
abstract class InfrastructureFailure {}

@freezed

/// Contains all the infrastructure failures associated with Core such as
/// - serverError
/// - databaseError
/// - invalidData
/// - unauthorized
class CoreInfrastructureFailure extends InfrastructureFailure
    with _$CoreInfrastructureFailure {
  /// CoreInfrastructureFailure which represents that an error occurred due to
  /// some problem in the server.
  const factory CoreInfrastructureFailure.serverError() = ServerError;

  /// CoreInfrastructureFailure which represents that an error occurred due to
  /// some problem in the local database.
  const factory CoreInfrastructureFailure.databaseError() = DatabaseError;

  /// CoreInfrastructureFailure which represents that the data sent to the
  /// server is not correct.
  const factory CoreInfrastructureFailure.invalidData() = InvalidData;

  /// CoreInfrastructureFailure which represents that the Bearer token is
  /// either invalid or missing.
  const factory CoreInfrastructureFailure.unauthorized() = Unauthorized;
}
