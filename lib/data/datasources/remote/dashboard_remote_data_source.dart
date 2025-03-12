import 'package:dio/dio.dart';
import 'package:laravel_user_management_mobile_app/core/network/api.dart';

import '../../models/dashboard_data.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardData> getDashboardData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSourceImpl({required this.dio});

  @override
  Future<DashboardData> getDashboardData() async {
    try {
      print(
          "\n\n =============Fetching dashboard data...(Level 3)================  \n\n");
      final response = await dio.get(API.DASHBOARD);
      return DashboardData.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get users list');
    }
  }
}
