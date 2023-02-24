import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swarm_rover_system_client/core/core.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required AdminIsar? admin,
    required Either<InfrastructureFailure, Unit>? successOrFailure,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        isLoading: false,
        admin: null,
        successOrFailure: null,
      );
}
