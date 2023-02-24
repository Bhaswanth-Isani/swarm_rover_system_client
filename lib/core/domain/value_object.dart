import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:swarm_rover_system_client/core/domain/crash_error.dart';
import 'package:swarm_rover_system_client/type_defs.dart';

@immutable
abstract class ValueObject<T> {
  /// Returns value after validating and is of type
  /// Either<ValueFailure<T>, T>.
  EitherFailure<T> get validatedValue;

  /// Returns the normal value which is passed as input to class and is of type
  /// T.
  T get value;

  /// Throws UnexpectedValueError containing the ValueFailure
  T getOrCrash() {
    return validatedValue.fold((f) => throw UnexpectedValueError(f), id);
  }

  /// Returns true if the value is success (right) and false if the value is a
  /// failure (left).
  bool isValid() {
    return validatedValue.isRight();
  }

  String? validator();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.validatedValue == validatedValue;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$validatedValue';
}
