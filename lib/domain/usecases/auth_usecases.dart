import 'package:digital_license/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);
  Future<void> call({required String token, required String userId, required String userName}) async {
    return await repository.saveCredentials(token: token, userId: userId, userName: userName);
  }
}

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);
  Future<void> call() async => await repository.logout();
}

class CheckAuthStatusUseCase {
  final AuthRepository repository;
  CheckAuthStatusUseCase(this.repository);
  Future<bool> call() async => await repository.isAuthenticated();
}

class AuthUseCases {
  final AuthRepository repository;
  AuthUseCases(this.repository);
  LoginUseCase get login => LoginUseCase(repository);
  LogoutUseCase get logout => LogoutUseCase(repository);
  CheckAuthStatusUseCase get checkAuthStatus => CheckAuthStatusUseCase(repository);
}