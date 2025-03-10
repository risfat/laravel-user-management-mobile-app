import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';

import '../../data/models/user_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password);
  Future<Either<Failure, Map<String, dynamic>>> register(
      String name, String email, String password, String passwordConfirmation);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getAuthenticatedUser();
}
