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
  }) : super(const UserState()) {
    on<GetUsersEvent>(_onGetUsers);
    on<LoadMoreUsersEvent>(_onLoadMoreUsers);
    on<GetUserEvent>(_onGetUser);
    on<CreateUserEvent>(_onCreateUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  Future<void> _onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await listUsersUseCase.execute(event.page);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (users) => emit(state.copyWith(
        isLoading: false,
        users: users,
        hasReachedMax: users.length < 10,
        currentPage: event.page,
      )),
    );
  }

  Future<void> _onLoadMoreUsers(
      LoadMoreUsersEvent event, Emitter<UserState> emit) async {
    if (!state.hasReachedMax) {
      final nextPage = state.currentPage + 1;
      final result = await listUsersUseCase.execute(nextPage);
      result.fold(
        (failure) => emit(state.copyWith(error: failure.message)),
        (newUsers) => emit(state.copyWith(
          users: [...state.users, ...newUsers],
          hasReachedMax: newUsers.length < 10,
          currentPage: nextPage,
        )),
      );
    }
  }

  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await getUserUseCase.execute(event.userId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (user) => emit(state.copyWith(isLoading: false, selectedUser: user)),
    );
  }

  Future<void> _onCreateUser(
      CreateUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await createUserUseCase.execute(
        event.name, event.email, event.password);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (user) => emit(state.copyWith(
        isLoading: false,
        successMessage: 'User created successfully',
        users: [user, ...state.users],
      )),
    );
  }

  Future<void> _onUpdateUser(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await updateUserUseCase.execute(
      event.userId,
      name: event.name,
      email: event.email,
      password: event.password,
      role: event.role,
      phone: event.phone,
      address: event.address,
      city: event.city,
      state: event.state,
      country: event.country,
      zipCode: event.zipCode,
      dateOfBirth: event.dateOfBirth,
      gender: event.gender,
      bio: event.bio,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (updatedUser) {
        final updatedUsers = state.users
            .map((user) => user.id == updatedUser.id ? updatedUser : user)
            .toList();
        emit(state.copyWith(
          isLoading: false,
          successMessage: 'User updated successfully',
          users: updatedUsers,
          selectedUser: updatedUser,
        ));
      },
    );
  }

  Future<void> _onDeleteUser(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await deleteUserUseCase.execute(event.userId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (_) {
        final updatedUsers =
            state.users.where((user) => user.id != event.userId).toList();
        emit(state.copyWith(
          isLoading: false,
          successMessage: 'User deleted successfully',
          users: updatedUsers,
          selectedUser: null,
        ));
      },
    );
  }
}
