import 'package:digital_license/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const String _credentialsKey = 'auth_credentials';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';

  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return false;
  }

  @override
  Future<String?> getUserId() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return null;
  }

  @override
  Future<String?> getUserName() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return null;
  }

  @override
  Future<void> saveCredentials({
    required String token,
    required String userId,
    required String userName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}