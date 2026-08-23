import 'dart:math';

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

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
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              return CustomPaint(
                painter: _GlowPainter(controller.value),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double progress;

  _GlowPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        100,
      );

    final x = size.width *
        (0.20 + 0.12 * sin(progress * 2 * pi));

    final y = size.height * 0.18;

    paint.color =
        AppTheme.primary.withValues(alpha: 0.07);

    canvas.drawCircle(
      Offset(x, y),
      200,
      paint,
    );

    paint.color =
        AppTheme.secondary.withValues(alpha: 0.055);

    canvas.drawCircle(
      Offset(
        size.width * 0.82,
        size.height * 0.42,
      ),
      250,
      paint,
    );
  }

  @override
  bool shouldRepaint(
    covariant _GlowPainter oldDelegate,
  ) {
    return oldDelegate.progress != progress;
  }
}