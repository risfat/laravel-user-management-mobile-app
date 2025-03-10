import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';

import '../repositories/authentication_repository.dart';

class Logout {
  final AuthenticationRepository repository;

  Logout(this.repository);

  Future<Either<Failure, void>> execute() async {
    return await repository.logout();
  }
}
