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
      String name, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final createdUser =
            await remoteDataSource.createUser(name, email, password);
        // await localDataSource.cacheUser(createdUser);
        return Right(createdUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to create user'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.getUser(id);
        // await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to fetch user'));
      }
    } else {
      return const Left(ServerFailure('Failed to fetch user'));
      // try {
      //   final user = await localDataSource.getUser(id);
      //   return Right(user);
      // } on CacheException catch (e) {
      //   return Left(
      //       CacheFailure(e.message ?? 'Failed to retrieve cached user'));
      // }
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
    if (await networkInfo.isConnected) {
      try {
        final updatedUser = await remoteDataSource.updateUser(id,
            email: email, name: name, password: password);
        // await localDataSource.cacheUser(updatedUser);
        return Right(updatedUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to update user'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(id);
        // await localDataSource.removeUser(id);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to delete user'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsersList(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final users = await remoteDataSource.listUsers(page);
        // await localDataSource.cacheUsers(
        //     users, 1);
        return Right(users);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to list users'));
      }
    } else {
      return const Left(ServerFailure('Failed to get the users list'));
      // try {
      //   final users = await localDataSource.listUsers();
      //   return Right(users);
      // } on CacheException catch (e) {
      //   return Left(CacheFailure(e.message ?? 'Failed to retrieve cached users list'));
      // }
    }
  }
}
