import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/features/auth/presentation/views/regiser_screen.dart';
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
        return RegiserScreen();
      },
    ),
  ],
);
