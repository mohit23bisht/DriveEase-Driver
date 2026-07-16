import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
