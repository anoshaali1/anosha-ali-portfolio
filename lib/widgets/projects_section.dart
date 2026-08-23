import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme/app_theme.dart';
import '../data/projects.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
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
              const Text(
                'MY WORK',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 13,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Featured Projects',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 45),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  if (isMobile) {
                    return Column(
                      children: projects.map((project) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _ProjectCard(project: project),
                        );
                      }).toList(),
                    );
                  }

                  final cardWidth =
                      (constraints.maxWidth - 40) / 3;

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: projects.map((project) {
                      return SizedBox(
                        width: cardWidth,
                        child: _ProjectCard(
                          project: project,
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

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({
    required this.project,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hovering = false;

  Future<void> _openGithub() async {
    final uri = Uri.parse(widget.project.githubUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: hovering
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hovering
                ? AppTheme.primary.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.10),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.project.icon,
              style: const TextStyle(
                fontSize: 38,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.project.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              widget.project.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: widget.project.technologies
                  .take(5)
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary
                            .withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 25),

            TextButton.icon(
              onPressed: _openGithub,
              icon: const Icon(
                Icons.open_in_new,
                size: 17,
              ),
              label: const Text('View on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}