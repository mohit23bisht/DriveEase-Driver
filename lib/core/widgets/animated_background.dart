import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          fit: StackFit.expand,
          children: [

            /// Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.splashTop,
                    AppColors.darkBackground,
                  ],
                ),
              ),
            ),

            /// Top Glow
            Positioned(
              top: -120 + (_controller.value * 40),
              left: -80,
              child: _GlowCircle(
                size: 280,
                color: Colors.blue.withOpacity(.22),
              ),
            ),

            /// Right Glow
            Positioned(
              top: 220,
              right: -120 + (_controller.value * 70),
              child: _GlowCircle(
                size: 220,
                color: AppColors.primary.withValues(alpha: .18),
              ),
            ),

            /// Bottom Glow
            Positioned(
              bottom: -80,
              left: 40 + (_controller.value * 50),
              child: _GlowCircle(
                size: 250,
                color: Colors.cyan..withValues(alpha: .12),
              ),
            ),

            widget.child,
          ],
        );
      },
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 80,
        sigmaY: 80,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}