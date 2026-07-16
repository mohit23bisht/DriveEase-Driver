import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final double borderRadius;

  final double blur;

  final Color? color;

  final Border? border;

  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 24,
    this.blur = 18,
    this.color,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),

        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: AppColors.darkShadow.withOpacity(.25),
                blurRadius: 30,
                spreadRadius: -5,
                offset: const Offset(0, 15),
              ),
            ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),

          child: Container(
            padding: padding,

            decoration: BoxDecoration(
              color: color ?? AppColors.glass,

              borderRadius:
                  BorderRadius.circular(borderRadius),

              border: border ??
                  Border.all(
                    color: AppColors.glassBorder,
                    width: 1.2,
                  ),
            ),

            child: child,
          ),
        ),
      ),
    );
  }
}