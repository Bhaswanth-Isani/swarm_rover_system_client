import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_client/core/domain/value_failure.dart';

part 'user_failures.freezed.dart';

@freezed

/// Contains all the failures associated with User such as
/// - invalidEmail
class UserFailure<T> extends ValueFailure<T> with _$UserFailure<T> {
  /// UserFailure which represents that the given input does not resemble an
  /// email.
  const factory UserFailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;
  const factory UserFailure.invalidOTP({required T failedValue}) =
      InvalidOTP<T>;
}
