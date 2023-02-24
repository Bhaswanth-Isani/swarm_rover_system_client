import 'package:swarm_rover_system_client/core/domain/value_failure.dart';

// TODO(bhaswanth-isani): Add an API call to report crash.
/// When instantiated the app will crash.
class UnexpectedValueError<T> extends Error {
  UnexpectedValueError(this.valueFailure);

  final ValueFailure<T> valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';

    return Error.safeToString('$explanation, Failure was: $valueFailure');
  }
}
