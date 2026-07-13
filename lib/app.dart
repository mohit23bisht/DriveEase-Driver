import 'package:flutter/material.dart';

import 'core/router/router.dart' as AppRouter;
import 'core/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'DriveEase',

      routerConfig: AppRouter.router,

      theme: AppTheme.light,

      themeMode: ThemeMode.system,
    );
  }
}
