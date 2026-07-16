import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double logoSize;

  final bool showTitle;

  final bool showSubtitle;

  final String title;

  final String subtitle;

  const AppLogo({
    super.key,
    this.logoSize = 90,
    this.showTitle = true,
    this.showSubtitle = true,
    this.title = "DriveEase",
    this.subtitle = "Drive Smarter. Earn Better.",
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: "app_logo",
          child: Container(
            width: logoSize,
            height: logoSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(.35),
                  blurRadius: 35,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        if (showTitle) ...[
          const SizedBox(height: 20),

          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.textPrimary,
              letterSpacing: .5,
            ),
          ),
        ],

        if (showSubtitle) ...[
          const SizedBox(height: 8),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}