import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/entities/user.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/authentication_repository.dart';

class GetAuthenticatedUser {
  final AuthenticationRepository repository;

  GetAuthenticatedUser(this.repository);

  Future<Either<Failure, User>> execute() async {
    return await repository.getAuthenticatedUser();
  }
}
