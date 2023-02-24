import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:swarm_rover_system_client/api/api.dart';
import 'package:swarm_rover_system_client/core/core.dart';

abstract class BaseAuthLocalRepository {
  /// Returns AdminIsar from local database if available else returns
  /// CoreInfrastructureFailure
  /// - unauthorized
  Either<InfrastructureFailure, AdminIsar> getLoggedInUser();

  /// Returns AdminIsar if the Admin is successfully save into the database else
  /// returns CoreInfrastructureFailure
  /// - uniqueViolation
  /// - databaseError
  Either<InfrastructureFailure, AdminIsar> saveLoggedInUser(
    UserApiResponse userApiResponse,
  );

  /// Returns Unit if the Admin document is successfully deleted else returns
  /// an InfrastructureFailure.
  Either<InfrastructureFailure, Unit> signOut();
}

/// Provides all the methods useful in storing auth data locally. These methods
/// include
/// - getLoggedInUser
/// - saveLoggedInUser
final authLocalRepositoryProvider = Provider<AuthLocalRepository>(
  (ref) {
    final isar = ref.watch(isarClientProvider);

    return AuthLocalRepository(isar);
  },
);

class AuthLocalRepository implements BaseAuthLocalRepository {
  AuthLocalRepository(this._isar);

  final Isar _isar;

  @override
  Either<InfrastructureFailure, AdminIsar> getLoggedInUser() {
    // Gets the Admin using id 0 from local database. If it finds a document
    // then returns it else returns an InfrastructureError.
    final admin = _isar.adminIsars.filter().idEqualTo('0').findFirstSync();

    return admin != null
        ? right(admin)
        : left(const CoreInfrastructureFailure.unauthorized());
  }

  @override
  Either<InfrastructureFailure, AdminIsar> saveLoggedInUser(
    UserApiResponse userApiResponse,
  ) {
    final admin = AdminIsar()
      ..token = userApiResponse.token!
      ..email = userApiResponse.user!.email.value
      ..id = '0'
      ..username = userApiResponse.user!.username.value;

    // Creates a new Admin document in the database. If there is no error then
    // it returns admin else returns an InfrastructureFailure.
    try {
      _isar.writeTxnSync(() => _isar.adminIsars.putSync(admin));

      return right(admin);
    } catch (_) {
      return left(const CoreInfrastructureFailure.databaseError());
    }
  }

  @override
  Either<InfrastructureFailure, Unit> signOut() {
    try {
      _isar.writeTxnSync(() {
        final admin = _isar.adminIsars.filter().idEqualTo('0').findFirstSync();

        if (admin != null) {
          _isar.adminIsars.deleteSync(admin.isarId);
        }
      });

      return right(unit);
    } catch (_) {
      return left(const CoreInfrastructureFailure.databaseError());
    }
  }
}
