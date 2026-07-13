import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/router.dart';
import '../../../../core/theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate loading
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    /// TODO:
    /// Read JWT Token
    /// Check Login Status
    /// Initialize Firebase
    /// Load User Profile
    /// Check App Update
    /// Request Permissions

    final bool isLoggedIn = false;

    // if (isLoggedIn) {
    //   context.go(AppRoutes.home);
    // } else {
    //   context.go(AppRoutes.login);
    // }
  }

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
