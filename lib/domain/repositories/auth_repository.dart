import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String emailOrUsername, required String password});
  Future<void> logout();
  Future<String> refreshToken();
  Future<User?> me();
}


