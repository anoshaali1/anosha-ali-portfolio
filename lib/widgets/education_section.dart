import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleSection(
      label: 'EDUCATION',
      title: 'Academic Background',
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool mobile = constraints.maxWidth < 650;

            final Widget icon = const Icon(
              Icons.school_outlined,
              color: AppTheme.primary,
              size: 38,
            );

            final Widget information = Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  AppConstants.degree,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  '${AppConstants.university} — ${AppConstants.campus}',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'CGPA: ${AppConstants.cgpa}  •  Graduation: ${AppConstants.graduation}',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            );

            if (mobile) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  icon,
                  const SizedBox(height: 20),
                  information,
                ],
              );
            }

            return Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                icon,
                const SizedBox(width: 25),
                Expanded(child: information),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SimpleSection extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;

  const _SimpleSection({
    required this.label,
    required this.title,
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
            maxWidth: 1000,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                label,
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