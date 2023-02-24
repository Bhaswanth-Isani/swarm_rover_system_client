import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:swarm_rover_system_client/core/infrastructure/infrastructure.dart';

/// Returns an instance of Isar.
final isarClientProvider =
    Provider<Isar>((_) => Isar.openSync([AdminIsarSchema]));
