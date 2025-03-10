import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

import '../../data/models/user_model.dart';

class ListUsers {
  final UserRepository repository;

  ListUsers(this.repository);

  Future<Either<Failure, List<UserModel>>> execute(int page) async {
    return await repository.getUsersList(page);
  }
}
