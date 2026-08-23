import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 90,
      ),
      color: AppTheme.surface.withValues(alpha: 0.18),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1150,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MY TOOLKIT',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Technologies & Engineering Skills',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                'A combination of software development technologies, '
                'engineering practices, AI/ML knowledge and modern '
                'development tools.',
                style: TextStyle(
                  color: AppTheme.textSecondary.withValues(alpha: 0.85),
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 45),

              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width >= 1000) {
                    columns = 3;
                  } else if (width >= 650) {
                    columns = 2;
                  } else {
                    columns = 1;
                  }

                  const spacing = 20.0;

                  final cardWidth =
                      (width - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      // ------------------------------------------------
                      // LANGUAGES
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.code_rounded,
                        title: 'Languages',
                        description:
                            'Programming languages used across software and application development.',
                        technologies: const [
                          'Python',
                          'JavaScript',
                          'Dart',
                          'Java',
                          'C',
                          'SQL',
                        ],
                      ),

                      // ------------------------------------------------
                      // FRONTEND
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.web_rounded,
                        title: 'Frontend & UI',
                        description:
                            'Responsive interfaces and user-focused application development.',
                        technologies: const [
                          'React.js',
                          'HTML',
                          'CSS',
                          'JavaScript',
                          'Flutter',
                          'Streamlit',
                          'Responsive UI',
                        ],
                      ),

                      // ------------------------------------------------
                      // MOBILE
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.phone_android_rounded,
                        title: 'Mobile Development',
                        description:
                            'Cross-platform mobile applications with modern and responsive interfaces.',
                        technologies: const [
                          'Flutter',
                          'Dart',
                          'Firebase',
                          'Cloud Firestore',
                          'Real-Time Apps',
                        ],
                      ),

                      // ------------------------------------------------
                      // BACKEND
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.dns_rounded,
                        title: 'Backend & APIs',
                        description:
                            'Server-side applications, APIs and real-time communication systems.',
                        technologies: const [
                          'Node.js',
                          'Express.js',
                          'Flask',
                          'REST APIs',
                          'Socket.IO',
                          'WebRTC',
                        ],
                      ),

                      // ------------------------------------------------
                      // DATABASE
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.storage_rounded,
                        title: 'Databases',
                        description:
                            'Relational, NoSQL and cloud-based data management technologies.',
                        technologies: const [
                          'PostgreSQL',
                          'MongoDB',
                          'MySQL',
                          'Firebase',
                          'Cloud Firestore',
                        ],
                      ),

                      // ------------------------------------------------
                      // AI / ML
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.auto_awesome_rounded,
                        title: 'AI / Machine Learning',
                        description:
                            'Intelligent software applications and predictive solutions.',
                        technologies: const [
                          'Machine Learning',
                          'Predictive Modeling',
                          'AI Application Integration',
                          'Conversational AI',
                          'Python',
                        ],
                      ),

                      // ------------------------------------------------
                      // SOFTWARE ENGINEERING
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.architecture_rounded,
                        title: 'Software Engineering',
                        description:
                            'Engineering practices used to analyze, design, build and maintain software.',
                        technologies: const [
                          'Software Development Life Cycle',
                          'Requirements Engineering',
                          'Software Requirements Specification',
                          'Software Design',
                          'Software Architecture',
                          'System Analysis',
                          'Software Documentation',
                        ],
                      ),

                      // ------------------------------------------------
                      // REQUIREMENTS & REENGINEERING
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.transform_rounded,
                        title: 'Requirements & Reengineering',
                        description:
                            'Techniques for understanding, improving and evolving existing software systems.',
                        technologies: const [
                          'Requirements Elicitation',
                          'Requirements Analysis',
                          'Requirements Validation',
                          'Requirements Management',
                          'Software Reengineering',
                          'Reverse Engineering',
                          'Program Comprehension',
                          'Legacy System Modernization',
                        ],
                      ),

                      // ------------------------------------------------
                      // TESTING & QA
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.verified_outlined,
                        title: 'Testing & QA',
                        description:
                            'Software quality assurance, validation and debugging practices.',
                        technologies: const [
                          'Software Testing',
                          'API Testing',
                          'API Debugging',
                          'Integration Testing',
                          'Functional Testing',
                          'System Testing',
                          'Debugging',
                        ],
                      ),

                      // ------------------------------------------------
                      // DEVELOPMENT PRACTICES
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.sync_alt_rounded,
                        title: 'Development Practices',
                        description:
                            'Practical approaches for building maintainable and reliable software.',
                        technologies: const [
                          'Agile Development',
                          'Iterative Development',
                          'Version Control',
                          'Code Reviews',
                          'Debugging',
                          'API Integration',
                          'Real-Time Systems',
                        ],
                      ),

                      // ------------------------------------------------
                      // TOOLS
                      // ------------------------------------------------
                      _TechCategoryCard(
                        width: cardWidth,
                        icon: Icons.build_circle_outlined,
                        title: 'Tools & Platforms',
                        description:
                            'Development environments, version control and application platforms.',
                        technologies: const [
                          'Git',
                          'GitHub',
                          'VS Code',
                          'Android Studio',
                          'Firebase',
                          'Postman',
                        ],
                      ),
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

class _TechCategoryCard extends StatefulWidget {
  final double width;
  final IconData icon;
  final String title;
  final String description;
  final List<String> technologies;

  const _TechCategoryCard({
    required this.width,
    required this.icon,
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  State<_TechCategoryCard> createState() => _TechCategoryCardState();
}

class _TechCategoryCardState extends State<_TechCategoryCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
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
        width: widget.width,
        padding: const EdgeInsets.all(25),
        transform: isHovered
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? AppTheme.primary.withValues(alpha: 0.35)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.08),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.icon,
                    color: AppTheme.primary,
                    size: 23,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // DESCRIPTION
            Text(
              widget.description,
              style: TextStyle(
                color: AppTheme.textSecondary.withValues(alpha: 0.75),
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // SKILLS
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.technologies.map(
                (technology) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.background.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.05),
                      ),
                    ),
                    child: Text(
                      technology,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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