import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/helpers/di/dependency_injection.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/features/auth/data/repo/login_repo_imple.dart';
import 'package:wasalny_app/features/auth/data/repo/register_repo_imple.dart';
import 'package:wasalny_app/features/auth/data/repo/reset_pass_repo_imple.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/resetpassword/reset_pass_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:wasalny_app/features/auth/presentation/views/login_screen.dart';
import 'package:wasalny_app/features/auth/presentation/views/regiser_screen.dart';
import 'package:wasalny_app/features/home/presentation/views/driver_screen.dart';
import 'package:wasalny_app/features/home/presentation/views/rider_screen.dart';
import 'package:wasalny_app/features/splash/presentation/views/spalsh_screen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      name: RoutesName.spalshScreen,
      path: '/',
      builder: (context, state) {
        return SpalshScreen();
      },
    ),
    GoRoute(
      name: RoutesName.registerScreen,
      path: '/registerScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (_) =>
              RegisterCubit(registerRepoImple: getIt<RegisterRepoImple>()),
          child: RegiserScreen(),
        );
      },
    ),
    GoRoute(
      name: RoutesName.loginScreen,
      path: '/loginScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginCubit(loginRepoImple: getIt<LoginRepoImple>()),
          child: LogInScreen(),
        );
      },
    ),
    GoRoute(
      name: RoutesName.riderScreen,
      path: '/riderScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              LoginCubit(loginRepoImple: getIt<LoginRepoImple>()),
          child: RiderScreen(),
        );
      },
    ),
    GoRoute(
      name: RoutesName.driverScreen,
      path: '/driverScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              LoginCubit(loginRepoImple: getIt<LoginRepoImple>()),
          child: DriverScreen(),
        );
      },
    ),
    GoRoute(
      name: RoutesName.forgotpasswordScreen,
      path: '/forgotpasswordScreen',
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              ResetPassCubit(resetPassRepoImple: getIt<ResetPassRepoImple>()),
          child: ForgotPasswordScreen(),
        );
      },
    ),
  ],
);
