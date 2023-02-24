import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

/// Parent class for all failure classes.
abstract class ValueFailure<T> {}

@freezed

/// Contains all the value failures associated with Core such as
/// - shortString
class CoreFailure<T> extends ValueFailure<T> with _$CoreFailure<T> {
  /// CoreFailure which represents that the given input is not greater than
  /// the minimum length that is required.
  const factory CoreFailure.shortString({required T failedValue}) =
      ShortString<T>;
}
