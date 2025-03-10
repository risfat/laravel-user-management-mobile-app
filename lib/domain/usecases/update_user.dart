import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';

import '../../data/models/user_model.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<Either<Failure, UserModel>> execute(
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
  }) async {
    return await repository.updateUser(
      userId,
      name: name,
      email: email,
      password: password,
      role: role,
      phone: phone,
      address: address,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
      dateOfBirth: dateOfBirth,
      gender: gender,
      bio: bio,
    );
  }
}
