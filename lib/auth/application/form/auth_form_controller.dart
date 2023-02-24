import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/application/form/auth_form_state.dart';
import 'package:swarm_rover_system_client/core/core.dart';

abstract class BaseAuthFormController {
  void updateUsername(String username);
  void updateEmail(String email);
  void updatePassword(String password);
  void onSubmit({bool showErrors = true});
  void reset();
}

final authFormControllerProvider =
    StateNotifierProvider<AuthFormController, AuthFormState>(
  (ref) => AuthFormController(),
);

class AuthFormController extends StateNotifier<AuthFormState>
    implements BaseAuthFormController {
  AuthFormController() : super(AuthFormState.initial());

  @override
  void updateUsername(String username) {
    state = state.copyWith(username: Username(username));
  }

  @override
  void updateEmail(String email) {
    state = state.copyWith(email: EmailAddress(email));
  }

  @override
  void updatePassword(String password) {
    state = state.copyWith(password: Password(password));
  }

  @override
  void onSubmit({bool showErrors = true}) {
    state = state.copyWith(showErrors: showErrors);
  }

  @override
  void reset() {
    state = AuthFormState.initial();
  }
}
