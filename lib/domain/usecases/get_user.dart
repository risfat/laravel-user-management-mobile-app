import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

import '../../data/models/user_model.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, UserModel>> execute(int id) async {
    return await repository.getUser(id);
  }
}
