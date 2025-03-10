import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/authentication_repository.dart';

class Register {
  final AuthenticationRepository repository;

  Register(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> execute(String name,
      String email, String password, String passwordConfirmation) async {
    return await repository.register(
        name, email, password, passwordConfirmation);
  }
}
