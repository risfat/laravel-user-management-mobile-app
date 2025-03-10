import 'package:dio/dio.dart';
import 'package:laravel_user_management_mobile_app/core/network/api.dart';
import 'package:laravel_user_management_mobile_app/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> listUsers(int page);
  Future<UserModel> getUser(int id);
  Future<UserModel> createUser(String name, String email, String password);
  Future<UserModel> updateUser(int id,
      {String? name, String? email, String? password});
  Future<void> deleteUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> listUsers(int page) async {
    try {
      final response =
          await dio.get(API.USERS, queryParameters: {'page': page});
      return (response.data['data'] as List)
          .map((userData) => UserModel.fromJson(userData))
          .toList();
    } catch (e) {
      throw Exception('Failed to get users list');
    }
  }

  @override
  Future<UserModel> getUser(int id) async {
    try {
      final response = await dio.get('${API.USERS}/$id');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get user');
    }
  }

  @override
  Future<UserModel> createUser(
      String name, String email, String password) async {
    try {
      final response = await dio.post(
        API.USERS,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }

  @override
  Future<UserModel> updateUser(int id,
      {String? name, String? email, String? password}) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (password != null) data['password'] = password;

      final response = await dio.put(
        '${API.USERS}/$id',
        data: data,
      );
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      await dio.delete('${API.USERS}/$id');
    } catch (e) {
      throw Exception('Failed to delete user');
    }
  }
}
