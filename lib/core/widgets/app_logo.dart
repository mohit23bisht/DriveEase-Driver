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
    this.logoSize = 250,
    this.showTitle = false,
    this.showSubtitle = false,
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
          child: Image.asset(
            "assets/images/logo.png",
            width: logoSize,
          ),
        ),

       

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