import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failure, void>> execute(int id) async {
    return await repository.deleteUser(id);
  }
}
