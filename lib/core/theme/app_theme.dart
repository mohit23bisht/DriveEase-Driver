import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {

  AppTheme._();

  static ThemeData light = ThemeData(

    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(

      seedColor: AppColors.primary,

    ),

    appBarTheme: const AppBarTheme(

      backgroundColor: AppColors.background,

      elevation: 0,

    ),
    textTheme: AppTextTheme.light,

  );

}