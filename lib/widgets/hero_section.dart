import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/animated_hero_visual.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onContact,
  });

  // ============================================================
  // OPEN NORMAL URL
  // ============================================================

  Future<void> _openUrl(String url) async {
    final String cleanUrl = url.trim();

    if (cleanUrl.isEmpty) return;

    final Uri? uri = Uri.tryParse(cleanUrl);

    if (uri == null) {
      debugPrint('Invalid URL: $cleanUrl');
      return;
    }

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('Could not open URL: $cleanUrl');
      }
    } catch (e) {
      debugPrint('URL launch error: $e');
    }
  }

  // ============================================================
  // OPEN EMAIL
  // ============================================================

  Future<void> _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      queryParameters: <String, String>{
        'subject': 'READY TO BUILD • LEARN • INNOVATE',
        'body':
            'Hello Anosha,\n\n'
            'I would like to get in touch with you regarding a software '
            'engineering opportunity.\n\n'
            'Best regards,',
      },
    );

    try {
      final bool launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint(
          'No email application could be opened for ${AppConstants.email}',
        );
      }
    } catch (e) {
      debugPrint('Email launch error: $e');
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 850;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: 780,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 24 : 70,
            vertical: mobile ? 100 : 140,
          ),
          child: mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroContent(
                      onProjects: onProjects,
                      onContact: onContact,
                      openUrl: _openUrl,
                      openEmail: _openEmail,
                    ),

                    const SizedBox(height: 70),

                    const Center(
                      child: AnimatedHeroVisual(),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _HeroContent(
                        onProjects: onProjects,
                        onContact: onContact,
                        openUrl: _openUrl,
                        openEmail: _openEmail,
                      ),
                    ),

                    const SizedBox(width: 50),

                    const Expanded(
                      flex: 4,
                      child: Center(
                        child: AnimatedHeroVisual(),
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
// HERO CONTENT
// ============================================================

class _HeroContent extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final Future<void> Function(String) openUrl;
  final Future<void> Function() openEmail;

  const _HeroContent({
    required this.onProjects,
    required this.onContact,
    required this.openUrl,
    required this.openEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ======================================================
        // AVAILABILITY BADGE
        // ======================================================

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppTheme.primary.withValues(alpha: 0.30),
            ),
          ),
          child: const Text(
            'READY TO BUILD • LEARN • INNOVATE',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 10,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 28),

        // ======================================================
        // GREETING
        // ======================================================

        const Text(
          "Hi, I'm",
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 24,
          ),
        ),

        const SizedBox(height: 6),

        // ======================================================
        // NAME
        // ======================================================

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppTheme.primary,
                AppTheme.secondary,
              ],
            ).createShader(bounds);
          },
          child: const Text(
            AppConstants.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 68,
              fontWeight: FontWeight.w900,
              height: 1,
              letterSpacing: -2,
            ),
          ),
        ),

        const SizedBox(height: 22),

        // ======================================================
        // ROLE
        // ======================================================

        const Text(
          AppConstants.role,
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 10),

        // ======================================================
        // SPECIALIZATION
        // ======================================================

        const Text(
          'Full-Stack Development • AI/ML • Real-Time Applications',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 17,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 28),

        // ======================================================
        // DESCRIPTION
        // ======================================================

        const SizedBox(
          width: 680,
          child: Text(
            AppConstants.heroDescription,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 17,
              height: 1.8,
            ),
          ),
        ),

        const SizedBox(height: 38),

        // ======================================================
        // MAIN BUTTONS
        // ======================================================

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            ElevatedButton.icon(
              onPressed: onProjects,
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 18,
              ),
              label: const Text(
                'View My Work',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            OutlinedButton.icon(
              onPressed: onContact,
              icon: const Icon(
                Icons.mail_outline_rounded,
                size: 18,
              ),
              label: const Text(
                "Let's Connect",
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: AppTheme.primary.withValues(alpha: 0.7),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        // ======================================================
        // SOCIAL LINKS
        // ======================================================

        Row(
          children: [
            _SocialButton(
              icon: Icons.code_rounded,
              tooltip: 'GitHub',
              onPressed: () {
                openUrl(AppConstants.githubUrl);
              },
            ),

            const SizedBox(width: 8),

            _SocialButton(
              icon: Icons.business_center_outlined,
              tooltip: 'LinkedIn',
              onPressed: () {
                openUrl(AppConstants.linkedinUrl);
              },
            ),

            const SizedBox(width: 8),

            _SocialButton(
              icon: Icons.email_outlined,
              tooltip: 'Email',
              onPressed: openEmail,
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// SOCIAL BUTTON
// ============================================================

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: AppTheme.textSecondary,
        tooltip: tooltip,
        style: IconButton.styleFrom(
          backgroundColor: AppTheme.surface,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}