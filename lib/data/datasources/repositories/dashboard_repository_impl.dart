import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../domain/repositories/dashboard_repository.dart';
import '../../models/dashboard_data.dart';
import '../remote/dashboard_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remoteDataSource.getDashboardData();
        // await localDataSource.cacheUser(createdUser);
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message ?? 'Failed to create user'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }
}
