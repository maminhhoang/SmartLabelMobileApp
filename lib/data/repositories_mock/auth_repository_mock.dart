import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  User? _current;

  @override
  Future<User> login({required String emailOrUsername, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _current = User(userId: 1, username: 'demo', email: 'demo@example.com', role: 'Labeler', isActive: true);
    return _current!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _current = null;
  }

  @override
  Future<String> refreshToken() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return 'mock-token';
  }

  @override
  Future<User?> me() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _current;
  }
}


