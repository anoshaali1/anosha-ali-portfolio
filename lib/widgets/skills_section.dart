import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const skillCategories = [
      _SkillCategory(
        title: 'Programming Languages',
        subtitle: 'Core languages and programming foundations',
        icon: Icons.code_rounded,
        skills: [
          'Python',
          'JavaScript',
          'Dart',
          'Java',
          'C',
          'SQL',
        ],
      ),
      _SkillCategory(
        title: 'Frontend Development',
        subtitle: 'Modern interfaces and responsive application development',
        icon: Icons.web_rounded,
        skills: [
          'React.js',
          'JavaScript ES6+',
          'HTML5',
          'CSS3',
          'Flutter',
          'Responsive UI',
          'Streamlit',
        ],
      ),
      _SkillCategory(
        title: 'Backend Development',
        subtitle: 'APIs, server-side applications and application architecture',
        icon: Icons.dns_rounded,
        skills: [
          'Node.js',
          'Express.js',
          'Flask',
          'REST APIs',
          'Socket.IO',
          'WebRTC',
        ],
      ),
      _SkillCategory(
        title: 'Databases & Cloud',
        subtitle: 'Data storage, cloud services and application backends',
        icon: Icons.storage_rounded,
        skills: [
          'MongoDB',
          'PostgreSQL',
          'MySQL',
          'Firebase',
          'Cloud Firestore',
        ],
      ),
      _SkillCategory(
        title: 'AI / Machine Learning',
        subtitle: 'Intelligent systems and practical AI applications',
        icon: Icons.auto_awesome_rounded,
        skills: [
          'Machine Learning',
          'Predictive Modeling',
          'AI Application Integration',
          'Conversational AI',
          'Python',
          'Data Preprocessing',
        ],
      ),
      _SkillCategory(
        title: 'Testing & Quality Assurance',
        subtitle: 'API testing, debugging and software quality practices',
        icon: Icons.verified_rounded,
        skills: [
          'API Testing',
          'API Debugging',
          'Postman',
          'Unit Testing',
          'Integration Testing',
          'Debugging',
        ],
      ),
      _SkillCategory(
        title: 'Real-Time & Networking',
        subtitle: 'Communication systems and real-time application technologies',
        icon: Icons.wifi_rounded,
        skills: [
          'Socket.IO',
          'WebRTC',
          'Real-Time Communication',
          'WebSockets',
          'Client–Server Architecture',
          'REST Architecture',
        ],
      ),
      _SkillCategory(
        title: 'Tools & Software Technologies',
        subtitle: 'Development tools and engineering workflow',
        icon: Icons.build_circle_outlined,
        skills: [
          'Git',
          'GitHub',
          'VS Code',
          'Android Studio',
          'Postman',
          'Firebase',
          'Flutter SDK',
          'Node.js',
        ],
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 100,
      ),
      color: AppTheme.surface.withValues(alpha: 0.20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SECTION LABEL
              const Text(
                'TECHNICAL EXPERTISE',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2.2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // TITLE
              const Text(
                'Skills & Technologies',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 18),

              // DESCRIPTION
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 760,
                ),
                child: const Text(
                  'A versatile technical skill set spanning frontend and backend '
                  'development, mobile applications, databases, AI/ML, testing, '
                  'real-time systems and modern software engineering tools.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                    height: 1.7,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // SKILL GRID
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width >= 1050) {
                    columns = 2;
                  } else {
                    columns = 1;
                  }

                  final spacing = columns == 2 ? 22.0 : 18.0;

                  final cardWidth =
                      (width - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: skillCategories.map(
                      (category) {
                        return SizedBox(
                          width: cardWidth,
                          child: _SkillCard(
                            category: category,
                          ),
                        );
                      },
                    ).toList(),
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
// SKILL CATEGORY MODEL
// ============================================================

class _SkillCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.skills,
  });
}


// ============================================================
// SKILL CARD
// ============================================================

class _SkillCard extends StatefulWidget {
  final _SkillCategory category;

  const _SkillCard({
    required this.category,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final category = widget.category;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,

      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),

        transform: isHovered
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),

        padding: const EdgeInsets.all(28),

        decoration: BoxDecoration(
          color: AppTheme.surface,

          borderRadius: BorderRadius.circular(22),

          border: Border.all(
            color: isHovered
                ? AppTheme.primary.withValues(alpha: 0.45)
                : Colors.white.withValues(alpha: 0.06),
          ),

          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.10),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================================================
            // ICON + CATEGORY
            // ==================================================

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,

                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppTheme.primary.withValues(alpha: 0.15),
                    ),
                  ),

                  child: Icon(
                    category.icon,
                    color: AppTheme.primary,
                    size: 24,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ==================================================
            // DESCRIPTION
            // ==================================================

            Text(
              category.subtitle,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 22),

            // ==================================================
            // DIVIDER
            // ==================================================

            Container(
              height: 1,
              color: Colors.white.withValues(alpha: 0.06),
            ),

            const SizedBox(height: 22),

            // ==================================================
            // SKILLS
            // ==================================================

            Wrap(
              spacing: 9,
              runSpacing: 9,

              children: category.skills.map(
                (skill) {
                  return _SkillChip(
                    label: skill,
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================
// SKILL CHIP
// ============================================================

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),

      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.70),

        borderRadius: BorderRadius.circular(9),

        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),

      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}