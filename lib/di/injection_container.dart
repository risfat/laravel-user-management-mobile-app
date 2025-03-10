import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:laravel_user_management_mobile_app/data/datasources/remote/authentication_remote_data_source.dart';
import 'package:laravel_user_management_mobile_app/data/datasources/remote/user_remote_data_source.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/authentication_repository.dart';
import 'package:laravel_user_management_mobile_app/domain/repositories/user_repository.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/create_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/delete_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/get_authenticated_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/get_user.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/list_users.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/login.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/logout.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/register.dart';
import 'package:laravel_user_management_mobile_app/domain/usecases/update_user.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';

import '../core/config/boxs.dart';
import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';
import '../data/datasources/local/user_local_data_source.dart';
import '../data/datasources/repositories/authentication_repository_impl.dart';
import '../data/datasources/repositories/user_repository_impl.dart';
import '../presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import '../presentation/bloc/sign_in_form/sign_in_form_bloc.dart';
import '../presentation/bloc/sign_up_form/sign_up_form_bloc.dart';
import '../presentation/cubit/theme/theme_cubit.dart';

final getIt = GetIt.instance;

// Function to initialize the dependency injection
Future<void> initializeDependencies() async {
  setupSynchronousRegistrations();
  await setupAsynchronousRegistrations();
}

void setupSynchronousRegistrations() {
  // BLoCs
  getIt.registerLazySingleton(() => AuthenticatorWatcherBloc());
  getIt.registerLazySingleton(() => ThemeCubit());
  getIt.registerLazySingleton(() => SignInFormBloc(getIt()));
  getIt.registerLazySingleton(() => SignUpFormBloc(getIt()));

  // getIt.registerFactory(
  //   () => AuthBloc(
  //     loginUseCase: getIt(),
  //     registerUseCase: getIt(),
  //     logoutUseCase: getIt(),
  //     getAuthenticatedUserUseCase: getIt(),
  //   ),
  // );

  getIt.registerFactory(
    () => UserBloc(
      listUsersUseCase: getIt(),
      getUserUseCase: getIt(),
      createUserUseCase: getIt(),
      updateUserUseCase: getIt(),
      deleteUserUseCase: getIt(),
    ),
  );

  // External
  getIt.registerLazySingleton(() => InternetConnectionChecker.instance);
  getIt.registerLazySingleton(() => DioClient.instance);

  // Network
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => Login(getIt()));
  getIt.registerLazySingleton(() => Register(getIt()));
  getIt.registerLazySingleton(() => Logout(getIt()));
  getIt.registerLazySingleton(() => GetAuthenticatedUser(getIt()));
  getIt.registerLazySingleton(() => ListUsers(getIt()));
  getIt.registerLazySingleton(() => GetUser(getIt()));
  getIt.registerLazySingleton(() => CreateUser(getIt()));
  getIt.registerLazySingleton(() => UpdateUser(getIt()));
  getIt.registerLazySingleton(() => DeleteUser(getIt()));

  // Repositories
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(userBox: getIt()),
  );
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: getIt()),
  );
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(dio: getIt()),
  );
}

Future<void> setupAsynchronousRegistrations() async {
  // Open Hive box
  final userBox = await Hive.openBox<String>(HiveBox.userBox);
  // Register box in GetIt
  getIt.registerLazySingleton<Box<String>>(() => userBox);
}
