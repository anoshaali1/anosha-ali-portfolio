import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const achievements = [
      _Achievement(
        icon: Icons.emoji_events_rounded,
        award: 'Runner-up',
        category: 'Mobile Application Development',
        project: 'BiteBook – Smart Recipe App',
        description:
            'Recognized as runner-up for developing BiteBook, '
            'a smart recipe application focused on an engaging '
            'and practical mobile experience.',
        imagePath: 'assets/achievements/MAD.png',
      ),

      _Achievement(
        icon: Icons.emoji_events_rounded,
        award: 'Runner-up',
        category: 'Computer Networks Project',
        project: 'Computer Networks Academic Project',
        description:
            'Achieved runner-up position for a computer networks '
            'project demonstrating practical networking concepts '
            'and technical implementation.',
        imagePath: 'assets/achievements/CN.png',
      ),

      _Achievement(
        icon: Icons.workspace_premium_rounded,
        award: 'Certificate of Participation',
        category: 'Final Year Project Competition',
        project: 'Open Debate App',
        description:
            'Participated in the Final Year Project competition '
            'with Open Debate App, a real-time debate platform '
            'built using Flutter, Node.js, MongoDB, WebRTC and Socket.IO.',
        imagePath: 'assets/achievements/fyp.png',
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------------------------------------
              // SECTION LABEL
              // ------------------------------------------------

              const Text(
                'ACHIEVEMENTS & RECOGNITION',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // ------------------------------------------------
              // TITLE
              // ------------------------------------------------

              const Text(
                'Achievements',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // DESCRIPTION
              // ------------------------------------------------

              Text(
                'A selection of academic achievements, project '
                'recognition, and participation in software '
                'engineering competitions.',
                style: TextStyle(
                  color: AppTheme.textSecondary.withValues(
                    alpha: 0.9,
                  ),
                  fontSize: 16,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 45),

              // ------------------------------------------------
              // RESPONSIVE GRID
              // ------------------------------------------------

              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width >= 1050) {
                    columns = 3;
                  } else if (width >= 700) {
                    columns = 2;
                  } else {
                    columns = 1;
                  }

                  final spacing = 20.0;

                  final cardWidth =
                      (width - (spacing * (columns - 1))) /
                          columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: achievements.map((achievement) {
                      return SizedBox(
                        width: cardWidth,
                        child: _AchievementCard(
                          achievement: achievement,
                        ),
                      );
                    }).toList(),
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

// ============================================================
// ACHIEVEMENT MODEL
// ============================================================

class _Achievement {
  final IconData icon;
  final String award;
  final String category;
  final String project;
  final String description;
  final String imagePath;

  const _Achievement({
    required this.icon,
    required this.award,
    required this.category,
    required this.project,
    required this.description,
    required this.imagePath,
  });
}

// ============================================================
// ACHIEVEMENT CARD
// ============================================================

class _AchievementCard extends StatelessWidget {
  final _Achievement achievement;

  const _AchievementCard({
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------
          // IMAGE
          // --------------------------------------------------

          GestureDetector(
            onTap: () {
              _showImageDialog(
                context,
                achievement.imagePath,
              );
            },
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: Image.asset(
                    achievement.imagePath,
                    fit: BoxFit.cover,

                    // If the image is missing
                    // show a professional placeholder.
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Container(
                        color: AppTheme.background,
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                achievement.icon,
                                size: 52,
                                color: AppTheme.primary,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Achievement Image',
                                style: TextStyle(
                                  color:
                                      AppTheme.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Image overlay
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: 0.65,
                      ),
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.zoom_in_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // CONTENT
          // --------------------------------------------------

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // Award badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(
                      alpha: 0.10,
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.primary.withValues(
                        alpha: 0.20,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        achievement.icon,
                        size: 15,
                        color: AppTheme.primary,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        achievement.award,
                        style: const TextStyle(
                          color: AppTheme.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Category
                Text(
                  achievement.category,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 8),

                // Project
                Text(
                  achievement.project,
                  style: const TextStyle(
                    color: AppTheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 14),

                // Description
                Text(
                  achievement.description,
                  style: TextStyle(
                    color: AppTheme.textSecondary
                        .withValues(alpha: 0.9),
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 20),

                // View certificate button
                InkWell(
                  onTap: () {
                    _showImageDialog(
                      context,
                      achievement.imagePath,
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View Certificate / Proof',
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: AppTheme.primary,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // FULL IMAGE DIALOG
  // ==========================================================

  void _showImageDialog(
    BuildContext context,
    String imagePath,
  ) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(
        alpha: 0.88,
      ),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Container(
                        padding:
                            const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Image could not be loaded.',
                          style: TextStyle(
                            color:
                                AppTheme.textPrimary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor:
                        Colors.black.withValues(
                      alpha: 0.65,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}