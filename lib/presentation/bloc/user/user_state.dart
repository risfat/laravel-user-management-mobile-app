import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

// States for user listing
class UsersListState extends UserState {
  final List<UserModel> users;
  final bool hasReachedMax;
  final int currentPage;

  const UsersListState(this.users, this.hasReachedMax, this.currentPage);

  @override
  List<Object> get props => [users, hasReachedMax, currentPage];
}

// State for single user
class SingleUserState extends UserState {
  final UserModel user;

  const SingleUserState(this.user);

  @override
  List<Object> get props => [user];
}

// State for CRUD operations
class UserOperationState extends UserState {
  final String message;

  const UserOperationState(this.message);

  @override
  List<Object> get props => [message];
}
