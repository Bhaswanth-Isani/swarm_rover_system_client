import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provides an instance of Dio.
final dioClientProvider = Provider<Dio>((ref) => Dio());
