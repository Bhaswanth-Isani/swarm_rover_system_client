import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/application/auth_state.dart';
import 'package:swarm_rover_system_client/auth/infrastructure/infrastructure.dart';
import 'package:swarm_rover_system_client/core/core.dart';

abstract class BaseAuthController extends StateNotifier<AuthState> {
  BaseAuthController() : super(AuthState.initial()) {
    getLoggedInUser();
  }

  void getLoggedInUser();
  Future<void> createAccountUsingEmailAndPassword({
    required Username username,
    required EmailAddress email,
    required Password password,
  });
  Future<void> loginUsingEmailAndPassword({
    required EmailAddress email,
    required Password password,
  });
  void signOut();
}

/// Provides AuthState changes and methods such as
/// - getLoggedInUser
/// - createAccountUsingEmailAndPassword
/// - loginUsingEmailAndPassword
/// - sendOTP
/// - forgotPassword
/// - signOut
final authControllerProvider =
    StateNotifierProvider<BaseAuthController, AuthState>(
  (ref) {
    final authServerRepository = ref.watch(authServerRepositoryProvider);
    final authLocalRepository = ref.watch(authLocalRepositoryProvider);

    final authRepository = AuthRepository(
      server: authServerRepository,
      local: authLocalRepository,
    );

    return AuthController(authRepository);
  },
);

class AuthController extends StateNotifier<AuthState>
    implements BaseAuthController {
  AuthController(
    this._authRepository,
  ) : super(AuthState.initial()) {
    getLoggedInUser();
  }

  final AuthRepository _authRepository;

  /// Gets currently logged in user details from local database.
  @override
  void getLoggedInUser() {
    // Tries to get a document from the local database.
    _authRepository.local.getLoggedInUser().fold(
          // If there isn't any document in the local database then it returns
          // an InfrastructureFailure.
          (failure) => state = state.copyWith(
            admin: null,
            successOrFailure: left(failure),
          ),
          // If it finds an Admin document then the user is successfully logged
          // into the app.
          (admin) => state = state.copyWith(
            admin: admin,
            successOrFailure: right(unit),
          ),
        );
  }

  /// Creates a new account using username, email and password in the server and
  /// stores the information it gets in the local database.
  @override
  Future<void> createAccountUsingEmailAndPassword({
    required Username username,
    required EmailAddress email,
    required Password password,
  }) async {
    state = state.copyWith(
      isLoading: true,
      admin: null,
      successOrFailure: null,
    );

    // Sends the information to the server and gets a response from the server.
    final createAccountResponse =
        await _authRepository.server.createAccountUsingEmailAndPassword(
      username: username,
      email: email,
      password: password,
    );

    createAccountResponse.fold(
      // If the server response is an error then it returns a failure.
      (failure) => state = state.copyWith(
        isLoading: false,
        successOrFailure: left(failure),
      ),
      // If the server response is success then returns a UserApiResponse.
      (response) {
        // This data is then stored in the local database.
        _authRepository.local.saveLoggedInUser(response).fold(
              // If the data is not successfully stored in the database then we
              // will ask the user to login.
              (failure) => state = state.copyWith(
                isLoading: false,
                successOrFailure: left(failure),
              ),
              // If the data is successfully stored then the user has
              // successfully created an account.
              (admin) => state = state.copyWith(
                isLoading: false,
                admin: admin,
                successOrFailure: right(unit),
              ),
            );
      },
    );
  }

  /// Logs in the user using email and password in the server and stores the
  /// information it gets in the local database.
  @override
  Future<void> loginUsingEmailAndPassword({
    required EmailAddress email,
    required Password password,
  }) async {
    state = state.copyWith(
      isLoading: true,
      admin: null,
      successOrFailure: null,
    );

    // Sends the information to the server and gets a response from the server.
    final loginResponse =
        await _authRepository.server.loginUsingEmailAndPassword(
      email: email,
      password: password,
    );

    loginResponse.fold(
      // If the server response is an error then it returns a failure.
      (failure) => state = state.copyWith(
        isLoading: false,
        successOrFailure: left(failure),
      ),
      // If the server response is success then returns a UserApiResponse.
      (response) {
        _authRepository.local.saveLoggedInUser(response).fold(
              // If the data is not successfully stored in the database then we
              // will ask the user to try logging in again after some time.
              (failure) => state = state.copyWith(
                isLoading: false,
                successOrFailure: left(failure),
              ),
              // If the data is successfully stored then the user has
              // successfully logged in to the app.
              (admin) => state = state.copyWith(
                isLoading: false,
                admin: admin,
                successOrFailure: right(unit),
              ),
            );
      },
    );
  }

  /// Removes all the data in the local database.
  @override
  void signOut() {
    state = state.copyWith(successOrFailure: null);

    // Tries to delete all the data from the local database.
    _authRepository.local.signOut().fold(
          // If it was not able to delete the data successfully then it returns
          // a failure.
          (failure) => state = state.copyWith(successOrFailure: left(failure)),
          // If all the data is successfully deleted from the local database
          // then the user is successfully logged out.
          (_) => state = state.copyWith(
            admin: null,
            successOrFailure: right(unit),
          ),
        );
  }
}
