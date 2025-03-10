import 'package:dio/dio.dart';

import '../utilities/interceptors/auth_interceptor.dart';
import '../utilities/interceptors/dio_logging_interceptor.dart';
import '../utilities/token_service.dart';

class DioClient {
  static Dio? _instance;

  static Dio get instance {
    _instance ??= _createDioInstance();
    return _instance!;
  }

  static Dio _createDioInstance() {
    final dio = Dio();
    final tokenService = TokenService(dio);

    // Add AuthInterceptor
    dio.interceptors.add(AuthInterceptor(tokenService));

    // Add DioLoggingInterceptor
    dio.interceptors.add(DioLoggingInterceptor());

    return dio;
  }
}
