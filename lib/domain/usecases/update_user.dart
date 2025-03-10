import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/entities/user.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<Either<Failure, User>> execute(int id,
      {String? name, String? email, String? password}) async {
    return await repository.updateUser(id,
        name: name, email: email, password: password);
  }
}
