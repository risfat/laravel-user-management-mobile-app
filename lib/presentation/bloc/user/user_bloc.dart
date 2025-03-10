import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/create_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/delete_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/get_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/list_users.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/update_user.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ListUsers listUsersUseCase;
  final GetUser getUserUseCase;
  final CreateUser createUserUseCase;
  final UpdateUser updateUserUseCase;
  final DeleteUser deleteUserUseCase;

  UserBloc({
    required this.listUsersUseCase,
    required this.getUserUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UserInitial()) {
    on<GetUsersEvent>(_onGetUsers);
    on<LoadMoreUsersEvent>(_onLoadMoreUsers);
    on<GetUserEvent>(_onGetUser);
    on<CreateUserEvent>(_onCreateUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  Future<void> _onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await listUsersUseCase.execute(event.page);
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (users) => emit(UsersListState(users, users.length < 10, event.page)),
    );
  }

  Future<void> _onLoadMoreUsers(
      LoadMoreUsersEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is UsersListState && !currentState.hasReachedMax) {
      final nextPage = currentState.currentPage + 1;
      final result = await listUsersUseCase.execute(nextPage);
      result.fold(
        (failure) => emit(UserError(failure.message)),
        (newUsers) => emit(UsersListState(
          [...currentState.users, ...newUsers],
          newUsers.length < 10,
          nextPage,
        )),
      );
    }
  }

  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await getUserUseCase.execute(event.userId);
    result.fold(
      (failure) => emit(UserError(failure.toString())),
      (user) => emit(SingleUserState(user)),
    );
  }

  Future<void> _onCreateUser(
      CreateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await createUserUseCase.execute(
        event.name, event.email, event.password);
    result.fold(
      (failure) => emit(UserError(failure.toString())),
      (user) => emit(const UserOperationState('User created successfully')),
    );
  }

  Future<void> _onUpdateUser(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await updateUserUseCase.execute(
      event.userId,
      name: event.name,
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) => emit(UserError(failure.toString())),
      (user) => emit(const UserOperationState('User updated successfully')),
    );
  }

  Future<void> _onDeleteUser(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await deleteUserUseCase.execute(event.userId);
    result.fold(
      (failure) => emit(UserError(failure.toString())),
      (_) => emit(const UserOperationState('User deleted successfully')),
    );
  }
}
