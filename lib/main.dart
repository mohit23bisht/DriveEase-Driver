import 'package:driveease_driver/core/providers/app_providers.dart';
import 'package:driveease_driver/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase.initializeApp();

  /// await dotenv.load();

  /// await Hive.initFlutter();

  await configureDependencies();

  runApp(AppProviders(child: const App()));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.darkBackground,
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}
