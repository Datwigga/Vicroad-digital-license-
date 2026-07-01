abstract class AuthRepository {
  Future<bool> isAuthenticated();
  Future<String?> getUserId();
  Future<String?> getUserName();
  Future<void> saveCredentials({required String token, required String userId, required String userName});
  Future<void> logout();
}