import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';

import '../../data/models/dashboard_data.dart';
import '../repositories/dashboard_repository.dart';

class Dashboard {
  final DashboardRepository repository;

  Dashboard(this.repository);

  Future<Either<Failure, DashboardData>> execute(int id) async {
    return await repository.getDashboardData();
  }
}
