import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/get_authenticated_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/login.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/logout.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/constants.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login loginUseCase;
  final Register registerUseCase;
  final Logout logoutUseCase;
  final GetAuthenticatedUser getAuthenticatedUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getAuthenticatedUserUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    // on<GetAuthenticatedUserEvent>(_onGetAuthenticatedUser);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginUseCase.execute(event.email, event.password);
    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (data) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ACCESS_TOKEN, data['access_token']);
        return emit(AuthAuthenticated(data['access_token']));
      },
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await registerUseCase.execute(
      event.name,
      event.email,
      event.password,
      event.passwordConfirmation,
    );
    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (data) {
        return emit(AuthAuthenticated(data['user']));
      },
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await logoutUseCase.execute();
    result.fold(
      (failure) => emit(AuthError(failure.toString())),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  // Future<void> _onGetAuthenticatedUser(
  //     GetAuthenticatedUserEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //   final result = await getAuthenticatedUserUseCase.execute();
  //   result.fold(
  //     (failure) => emit(AuthUnauthenticated()),
  //     (user) => emit(AuthAuthenticated(user)),
  //   );
  // }
}
