import 'package:dio/dio.dart';
import 'package:laravel_user_management_mobile_app/core/network/api.dart';
import 'package:laravel_user_management_mobile_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/constants.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(
      String name, String email, String password, String passwordConfirmation);
  Future<void> logout();
  Future<UserModel> getAuthenticatedUser();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio dio;

  AuthenticationRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        API.LOGIN,
        data: {
          'email': email,
          'password': password,
        },
      );
      final String? accessToken = response.data['access_token'];
      if (accessToken != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ACCESS_TOKEN, accessToken);
      }
      return response.data;
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<Map<String, dynamic>> register(String name, String email,
      String password, String passwordConfirmation) async {
    try {
      final response = await dio.post(
        API.REGISTER,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      final String? accessToken = response.data['access_token'];
      if (accessToken != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(ACCESS_TOKEN, accessToken);
      }
      return response.data;
    } catch (e) {
      throw Exception('Failed to register');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dio.post(API.LOGOUT);
    } catch (e) {
      throw Exception('Failed to logout');
    }
  }

  @override
  Future<UserModel> getAuthenticatedUser() async {
    try {
      final response = await dio.get(API.GET_USER);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get authenticated user');
    }
  }
}
