import 'package:dartz/dartz.dart';
import 'package:swarm_rover_system_client/core/domain/value_failure.dart';

/// Shortcut Typedef for Either<ValueFailure<T>, T>.
typedef EitherFailure<T> = Either<ValueFailure<T>, T>;
