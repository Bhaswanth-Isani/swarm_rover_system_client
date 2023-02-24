import 'package:swarm_rover_system_client/auth/infrastructure/auth_local_repository.dart';
import 'package:swarm_rover_system_client/auth/infrastructure/auth_server_repository.dart';

class AuthRepository {
  AuthRepository({
    required this.server,
    required this.local,
  });

  final BaseAuthServerRepository server;
  final BaseAuthLocalRepository local;
}
