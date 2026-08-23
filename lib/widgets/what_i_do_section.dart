import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_Service> services = [
      _Service(
        icon: Icons.phone_android_rounded,
        title: 'Mobile Development',
        description:
            'Building responsive and scalable mobile applications using Flutter and Dart.',
      ),
      _Service(
        icon: Icons.web_rounded,
        title: 'Web Development',
        description:
            'Creating modern responsive web applications with clean and intuitive interfaces.',
      ),
      _Service(
        icon: Icons.dns_rounded,
        title: 'Backend Development',
        description:
            'Developing APIs, real-time systems and backend services using Node.js and Express.',
      ),
      _Service(
        icon: Icons.auto_awesome,
        title: 'AI / Machine Learning',
        description:
            'Building practical AI and machine learning solutions for real-world software problems.',
      ),
    ];

    return _Section(
      title: 'What I Do',
      subtitle: 'MY EXPERTISE',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double width =
              constraints.maxWidth < 600
                  ? constraints.maxWidth
                  : 270;

          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: services.map((service) {
              return SizedBox(
                width: width,
                child: _ServiceCard(
                  service: service,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _Service {
  final IconData icon;
  final String title;
  final String description;

  const _Service({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _ServiceCard extends StatefulWidget {
  final _Service service;

  const _ServiceCard({
    required this.service,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: hovering
            ? (Matrix4.identity()..translate(0.0, -5.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hovering
                ? AppTheme.primary.withValues(alpha: 0.45)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.08),
                    blurRadius: 25,
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.service.icon,
              color: AppTheme.primary,
              size: 34,
            ),

            const SizedBox(height: 20),

            Text(
              widget.service.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.service.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _Section({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              child,
            ],
          ),
        ),
      ),
    );
  }
}