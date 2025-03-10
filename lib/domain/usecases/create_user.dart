import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/entities/user.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<Either<Failure, User>> execute(
      String name, String email, String password) async {
    return await repository.createUser(name, email, password);
  }
}
