import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                'EXPERIENCE',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Professional Experience',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 45),

              Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppTheme.primary
                                .withValues(alpha: 0.10),
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.business_center_outlined,
                            color: AppTheme.primary,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 20),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IT Department Intern',
                                style: TextStyle(
                                  color:
                                      AppTheme.textPrimary,
                                  fontSize: 23,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 7),

                              Text(
                                'Pakistan Aeronautical Complex (PAC)',
                                style: TextStyle(
                                  color:
                                      AppTheme.primary,
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 6),

                              Text(
                                'IT Department',
                                style: TextStyle(
                                  color:
                                      AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _ExperiencePoint(
                      text:
                          'Designed and built the user interface and frontend logic in React for a secure, role-based authentication platform, connecting to backend services through REST APIs.',
                    ),

                    _ExperiencePoint(
                      text:
                          'Collaborated with backend developers to define API contracts and ensure the UI accurately reflected Admin and User access levels.',
                    ),

                    _ExperiencePoint(
                      text:
                          'Contributed to requirements discussions and design decisions in enterprise software planning meetings, tracking tasks through to delivery.',
                    ),

                    _ExperiencePoint(
                      text:
                          'Used Git and GitHub for version control while working in a collaborative enterprise software environment.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperiencePoint extends StatelessWidget {
  final String text;

  const _ExperiencePoint({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(
              Icons.circle,
              size: 7,
              color: AppTheme.primary,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                height: 1.7,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}