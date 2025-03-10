import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../models/user_model.dart';
import '../remote/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this.dataSource);
  final AuthenticationRemoteDataSource dataSource;

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await dataSource.login(email, password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure('No internet connection'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occurred Please try again',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(String name,
      String email, String password, String passwordConfirmation) async {
    try {
      final result = await dataSource.register(
          name, email, password, passwordConfirmation);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure('No internet connection'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occurred Please try again',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure('No internet connection'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occurred Please try again',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> getAuthenticatedUser() async {
    try {
      final result = await dataSource.getAuthenticatedUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure('No internet connection'),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occurred Please try again',
        ),
      );
    }
  }
}
