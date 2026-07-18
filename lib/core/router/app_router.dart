import 'package:driveease_driver/features/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';

import '../di/service_locator.dart';

final router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',

      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<SplashCubit>(),
          child: const SplashPage(),
        );
      },
    ),

    GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/signup', builder: (_, __) => const SignupPage()),

    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     return MainPage(navigationShell: navigationShell);
    //   },

    // branches: [
    //   StatefulShellBranch(
    //     routes: [
    //       //GoRoute(path: '/home', builder: (_, __) => const HomePage()),
    //     ],
    //   ),

    //   StatefulShellBranch(
    //     routes: [
    //       //GoRoute(path: '/ride', builder: (_, __) => const RidePage()),
    //     ],
    //   ),

    //   StatefulShellBranch(
    //     routes: [
    //       GoRoute(
    //         path: '/activity',
    //         //builder: (_, __) => const ActivityPage(),
    //       ),
    //     ],
    //   ),

    //   StatefulShellBranch(
    //     routes: [
    //       //GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
    //     ],
    //   ),
    // ],
    //),
  ],
);
