import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../models/user_model.dart';
import '../local/user_local_data_source.dart';
import '../remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
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
      String? bio}) async {
    try {
      final createdUser = await remoteDataSource.createUser(
        name,
        email,
        password,
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
      // await localDataSource.cacheUser(createdUser);
      return Right(createdUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to create user'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(int id) async {
    try {
      final user = await remoteDataSource.getUser(id);
      // await localDataSource.cacheUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch user'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser(
    int id, {
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
    try {
      final updatedUser = await remoteDataSource.updateUser(
        id,
        email: email,
        name: name,
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
      // await localDataSource.cacheUser(updatedUser);
      return Right(updatedUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to update user'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    try {
      await remoteDataSource.deleteUser(id);
      // await localDataSource.removeUser(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to delete user'));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsersList(int page) async {
    try {
      final users = await remoteDataSource.listUsers(page);
      // await localDataSource.cacheUsers(
      //     users, 1);
      return Right(users);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to list users'));
    }
  }
}
