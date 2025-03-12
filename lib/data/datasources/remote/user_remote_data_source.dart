import 'package:dio/dio.dart';
import 'package:laravel_user_management_mobile_app/core/network/api.dart';
import 'package:laravel_user_management_mobile_app/data/models/user_model.dart';

import '../../../core/error/exceptions.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> listUsers(int page);
  Future<UserModel> getUser(int id);
  Future<UserModel> createUser(String name, String email, String password,
      {String? phone,
      String? address,
      String? city,
      String? state,
      String? country,
      String? zipCode,
      DateTime? dateOfBirth,
      String? gender,
      String? bio});
  Future<UserModel> updateUser(
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
  });
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
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(int id) async {
    try {
      final response = await dio.get('${API.USERS}/$id');
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> createUser(String name, String email, String password,
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
      final response = await dio.post(
        API.USERS,
        data: {
          'name': name,
          'email': email,
          'password': password,
          "password_confirmation": password,
          'role': 'ReadOnly',
          if (phone != null && phone.isNotEmpty) 'phone': phone,
          if (address != null && address.isNotEmpty) 'address': address,
          if (city != null && city.isNotEmpty) 'city': city,
          if (state != null && state.isNotEmpty) 'state': state,
          if (country != null && country.isNotEmpty) 'country': country,
          if (zipCode != null && zipCode.isNotEmpty) 'zip_code': zipCode,
          if (dateOfBirth != null)
            'date_of_birth': dateOfBirth.toIso8601String(),
          if (gender != null && gender.isNotEmpty) 'gender': gender,
          if (bio != null && bio.isNotEmpty) 'bio': bio,
        },
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> updateUser(
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
      final response = await dio.put(
        '${API.USERS}/$id',
        data: {
          if (name != null) 'name': name,
          if (email != null) 'email': email,
          if (password != null) 'password': password,
          if (role != null) 'role': role,
          if (phone != null) 'phone': phone,
          if (address != null) 'address': address,
          if (city != null) 'city': city,
          if (state != null) 'state': state,
          if (country != null) 'country': country,
          if (zipCode != null) 'zip_code': zipCode,
          if (dateOfBirth != null)
            'date_of_birth': dateOfBirth.toIso8601String(),
          if (gender != null) 'gender': gender,
          if (bio != null) 'bio': bio,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Failed to update user',
        );
      }
    } catch (e) {
      rethrow;
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
