import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/user.dart';

final authRepositoryProvider = Provider((ref) => DI.authRepository);

final authStateProvider = FutureProvider<User?>((ref) async {
  final repo = ref.watch(authRepositoryProvider);
  return repo.me();
});


