import 'package:driveease_driver/features/splash/splash.dart';
import 'package:go_router/go_router.dart';
import '../../features/main/presentation/pages/main_page.dart';
import 'app_routes.dart';

import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashPage()),

   // GoRoute(path: '/login', builder: (_, __) => const LoginPage()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            //GoRoute(path: '/home', builder: (_, __) => const HomePage()),
          ],
        ),

        StatefulShellBranch(
          routes: [
            //GoRoute(path: '/ride', builder: (_, __) => const RidePage()),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/activity',
              //builder: (_, __) => const ActivityPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            //GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
          ],
        ),
      ],
    ),
  ],
);
