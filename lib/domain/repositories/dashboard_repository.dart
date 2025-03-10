import 'package:dartz/dartz.dart';
import 'package:laravel_user_management_mobile_app/core/error/failures.dart';

import '../../data/models/dashboard_data.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardData>> getDashboardData();
}
