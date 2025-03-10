import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUsersEvent extends UserEvent {
  final int page;
  const GetUsersEvent(this.page);
  @override
  List<Object> get props => [page];
}

class LoadMoreUsersEvent extends UserEvent {}

class GetUserEvent extends UserEvent {
  final int userId;

  const GetUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreateUserEvent extends UserEvent {
  final String name;
  final String email;
  final String password;

  const CreateUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class UpdateUserEvent extends UserEvent {
  final int userId;
  final String? name;
  final String? email;
  final String? password;
  final String? role;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? bio;

  const UpdateUserEvent({
    required this.userId,
    this.name,
    this.email,
    this.password,
    this.role,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.dateOfBirth,
    this.gender,
    this.bio,
  });

  @override
  List<Object?> get props => [
        userId,
        name,
        email,
        password,
        role,
        phone,
        address,
        city,
        state,
        country,
        zipCode,
        dateOfBirth,
        gender,
        bio,
      ];
}

class DeleteUserEvent extends UserEvent {
  final int userId;

  const DeleteUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class ErrorEvent extends UserEvent {
  final String error;
  const ErrorEvent(this.error);
  @override
  List<Object> get props => [error];
}

class ResetToUsersListEvent extends UserEvent {
  const ResetToUsersListEvent();
}
