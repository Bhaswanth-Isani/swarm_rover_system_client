import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_client/core/core.dart';

part 'auth_form_state.freezed.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    required Username username,
    required EmailAddress email,
    required Password password,
    required bool showErrors,
  }) = _AuthFormState;

  factory AuthFormState.initial() => AuthFormState(
        username: Username(''),
        email: EmailAddress(''),
        password: Password(''),
        showErrors: false,
      );
}
