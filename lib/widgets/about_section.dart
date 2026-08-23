import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            maxWidth: 1100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ABOUT ME',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Who I Am',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              LayoutBuilder(
                builder: (context, constraints) {
                  final bool mobile =
                      constraints.maxWidth < 750;

                  final Widget text = const Text(
                    AppConstants.aboutText,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 17,
                      height: 1.8,
                    ),
                  );

                  final Widget card = Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Facts',
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          '🎓 BS Software Engineering',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          '📊 CGPA 3.44 / 4.00',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          '💻 Full-Stack Development',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          '📱  Real-Time Systems',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          '🤖 AI / ML Applications',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );

                  if (mobile) {
                    return Column(
                      children: [
                        text,
                        const SizedBox(height: 30),
                        card,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(child: text),
                      const SizedBox(width: 50),
                      Expanded(child: card),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}