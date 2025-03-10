import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/authentication_repository.dart';

class Login {
  final AuthenticationRepository repository;

  Login(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> execute(
      String email, String password) async {
    return await repository.login(email, password);
  }
}
