import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laravel_user_management_mobile_app/di/injection_container.dart'
    as di;
import 'package:laravel_user_management_mobile_app/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/cubit/theme/theme_cubit.dart';

import 'core/utilities/app_bloc_observer.dart';
import 'core/utilities/go_router.dart';
import 'core/utilities/logger.dart';
import 'core/utilities/themes.dart';
import 'presentation/bloc/auth/sign_in_form/sign_in_form_bloc.dart';
import 'presentation/bloc/auth/sign_up_form/sign_up_form_bloc.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.transformer = bloc_concurrency.sequential();
        Bloc.observer = const AppBlocObserver();
        // Initialize Hive
        await Hive.initFlutter();
        di.initializeDependencies();
        runApp(const MyApp());
      },
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<AuthenticatorWatcherBloc>()),
        BlocProvider(create: (_) => di.getIt<SignInFormBloc>()),
        BlocProvider(create: (_) => di.getIt<SignUpFormBloc>()),
        BlocProvider<UserBloc>(
          create: (context) => di.getIt<UserBloc>(),
        ),
        BlocProvider(create: (_) => di.getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Laravel User Management',
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                themeState is ThemeDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: routerInit,
          );
        },
      ),
    );
  }
}
