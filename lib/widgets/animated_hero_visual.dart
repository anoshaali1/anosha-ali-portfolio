import 'dart:math';

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class AnimatedHeroVisual extends StatefulWidget {
  const AnimatedHeroVisual({
    super.key,
  });

  @override
  State<AnimatedHeroVisual> createState() =>
      _AnimatedHeroVisualState();
}

class _AnimatedHeroVisualState
    extends State<AnimatedHeroVisual>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
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
      builder: (context, child) {
        final double rotation =
            _controller.value * 2 * pi;

        final double floating =
            sin(_controller.value * 2 * pi) * 7;

        return SizedBox(
          width: 420,
          height: 450,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ==================================================
              // OUTER GLOW
              // ==================================================

              Container(
                width: 330,
                height: 330,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withValues(
                        alpha: 0.18,
                      ),
                      blurRadius: 100,
                      spreadRadius: 30,
                    ),
                  ],
                ),
              ),

              // ==================================================
              // ROTATING GRADIENT RING
              // ==================================================

              Transform.rotate(
                angle: rotation,
                child: Container(
                  width: 355,
                  height: 355,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        AppTheme.primary,
                        AppTheme.secondary,
                        AppTheme.primary.withValues(
                          alpha: 0.10,
                        ),
                        AppTheme.secondary,
                        AppTheme.primary,
                      ],
                    ),
                  ),
                ),
              ),

              // ==================================================
              // INNER CIRCLE
              // ==================================================

              Container(
                width: 342,
                height: 342,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.background,
                ),
              ),

              // ==================================================
              // AVATAR
              // ==================================================

              Transform.translate(
                offset: Offset(
                  0,
                  floating,
                ),
                child: Container(
                  width: 285,
                  height: 285,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.surface,
                    border: Border.all(
                      color: AppTheme.primary.withValues(
                        alpha: 0.20,
                      ),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Soft inner glow
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary.withValues(
                            alpha: 0.06,
                          ),
                        ),
                      ),

                      // Developer avatar
                      const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            size: 92,
                            color: AppTheme.primary,
                          ),

                          SizedBox(height: 8),

                          Text(
                            '</>',
                            style: TextStyle(
                              color: AppTheme.secondary,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                            ),
                          ),

                          SizedBox(height: 7),

                          Text(
                            'SOFTWARE ENGINEER',
                            style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 9,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ==================================================
              // FLOATING BADGES
              // ==================================================

              _FloatingBadge(
                text: '</>',
                top: 35,
                left: 35,
                animationValue: _controller.value,
                delay: 0,
              ),

              _FloatingBadge(
                text: '{ }',
                top: 65,
                right: 30,
                animationValue: _controller.value,
                delay: pi / 2,
              ),

              _FloatingBadge(
                text: 'AI',
                bottom: 65,
                left: 30,
                animationValue: _controller.value,
                delay: pi,
              ),

              _FloatingBadge(
                text: '⚡',
                bottom: 30,
                right: 45,
                animationValue: _controller.value,
                delay: pi * 1.5,
              ),

              // ==================================================
              // GLOW DOTS
              // ==================================================

              Transform.rotate(
                angle: -rotation,
                child: const Stack(
                  children: [
                    Positioned(
                      top: 22,
                      left: 205,
                      child: _GlowDot(
                        size: 8,
                        color: AppTheme.primary,
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 100,
                      child: _GlowDot(
                        size: 6,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Positioned(
                      top: 145,
                      right: 12,
                      child: _GlowDot(
                        size: 7,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================
// FLOATING BADGE
// ============================================================

class _FloatingBadge extends StatelessWidget {
  final String text;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double animationValue;
  final double delay;

  const _FloatingBadge({
    required this.text,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.animationValue,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final double offset =
        sin(
          (animationValue * 2 * pi) + delay,
        ) *
        7;

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform.translate(
        offset: Offset(
          0,
          offset,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: AppTheme.surface.withValues(
              alpha: 0.95,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppTheme.primary.withValues(
                alpha: 0.25,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(
                  alpha: 0.10,
                ),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: text == 'AI'
                  ? AppTheme.secondary
                  : AppTheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// GLOW DOT
// ============================================================

class _GlowDot extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowDot({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withValues(
              alpha: 0.55,
            ),
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
    );
  }
}