import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:digital_license/domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases authUseCases;

  AuthBloc(this.authUseCases) : super(const AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    
    if (event.inviteCode == '521vic125' && event.password == 'demo123') {
      await authUseCases.login(
        token: 'token_xyz',
        userId: 'user_123',
        userName: 'John Smith',
      );
      emit(const AuthSuccess(userId: 'user_123', userName: 'John Smith'));
    } else {
      emit(const AuthFailure(message: 'Invalid credentials'));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await authUseCases.logout();
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckAuthStatus(CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final isAuthenticated = await authUseCases.checkAuthStatus();
    if (isAuthenticated) {
      emit(const AuthSuccess(userId: 'user_123', userName: 'John Smith'));
    } else {
      emit(const AuthUnauthenticated());
    }
  }
}
