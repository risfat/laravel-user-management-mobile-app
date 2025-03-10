// ignore_for_file: constant_identifier_names

class API {
  static const BASE_URL = 'http://10.0.2.2:8000/api';

  // Authentication
  static const LOGIN = '$BASE_URL/login';
  static const REGISTER = '$BASE_URL/register';
  static const LOGOUT = '$BASE_URL/logout';
  static const GET_USER = '$BASE_URL/user';

  // User Management
  static const USERS = '$BASE_URL/users';
}
