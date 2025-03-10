import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';

import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getUsersList(int page);
  Future<Either<Failure, UserModel>> getUser(int id);
  Future<Either<Failure, UserModel>> createUser(
      String name, String email, String password,
      {String? phone,
      String? address,
      String? city,
      String? state,
      String? country,
      String? zipCode,
      DateTime? dateOfBirth,
      String? gender,
      String? bio});

  Future<Either<Failure, UserModel>> updateUser(
    int userId, {
    String? name,
    String? email,
    String? password,
    String? role,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    DateTime? dateOfBirth,
    String? gender,
    String? bio,
  });
  Future<Either<Failure, void>> deleteUser(int id);
}
