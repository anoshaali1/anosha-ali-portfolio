import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // ============================================================
  // OPEN EMAIL
  // ============================================================

  Future<void> _sendEmail() async {
    const String subject = 'Software Engineering Opportunity';
    const String body =
        'Hello Anosha,\n\n'
        'I would like to get in touch with you.';

    // Gmail compose URL
    final Uri gmailUri = Uri.https(
      'mail.google.com',
      '/mail/',
      {
        'view': 'cm',
        'fs': '1',
        'to': AppConstants.email,
        'su': subject,
        'body': body,
      },
    );

    try {
      final bool gmailOpened = await launchUrl(
        gmailUri,
        webOnlyWindowName: '_blank',
      );

      if (gmailOpened) {
        return;
      }
    } catch (e) {
      debugPrint('Gmail launch error: $e');
    }

    // ==========================================================
    // FALLBACK: MAILTO
    // ==========================================================

    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      final bool mailOpened = await launchUrl(
        mailtoUri,
        mode: LaunchMode.externalApplication,
      );

      if (!mailOpened) {
        debugPrint('Could not open email application.');
      }
    } catch (e) {
      debugPrint('Mailto launch error: $e');
    }
  }

  // ============================================================
  // OPEN EXTERNAL LINK
  // ============================================================

  Future<void> _openLink(String url) async {
    if (url.trim().isEmpty) {
      return;
    }

    final Uri uri = Uri.parse(url);

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('Could not open: $url');
      }
    } catch (e) {
      debugPrint('URL launch error: $e');
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 950,
          ),
          child: Column(
            children: [
              // --------------------------------------------------
              // LABEL
              // --------------------------------------------------

              const Text(
                'CONTACT',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              // --------------------------------------------------
              // TITLE
              // --------------------------------------------------

              const Text(
                "Let's Work Together",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 18),

              // --------------------------------------------------
              // DESCRIPTION
              // --------------------------------------------------

              Text(
                'Open to software engineering opportunities, '
                'graduate roles, internships and interesting '
                'technology projects.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textSecondary.withValues(
                    alpha: 0.85,
                  ),
                  fontSize: 16,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 40),

              // --------------------------------------------------
              // CONTACT BUTTONS
              // --------------------------------------------------

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ContactButton(
                    icon: Icons.email_outlined,
                    label: AppConstants.email,
                    onPressed: _sendEmail,
                  ),

                  _ContactButton(
                    icon: Icons.code_rounded,
                    label: 'GitHub',
                    onPressed: () {
                      _openLink(
                        AppConstants.githubUrl,
                      );
                    },
                  ),

                  _ContactButton(
                    icon: Icons.work_outline_rounded,
                    label: 'LinkedIn',
                    onPressed: () {
                      _openLink(
                        AppConstants.linkedinUrl,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // --------------------------------------------------
              // PRIMARY EMAIL BUTTON
              // --------------------------------------------------

              ElevatedButton.icon(
                onPressed: _sendEmail,
                icon: const Icon(
                  Icons.send_rounded,
                  size: 18,
                ),
                label: const Text(
                  'Email Me',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 17,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),

              const SizedBox(height: 45),

              // --------------------------------------------------
              // EMAIL ADDRESS
              // --------------------------------------------------

              Text(
                AppConstants.email,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textSecondary.withValues(
                    alpha: 0.65,
                  ),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// CONTACT BUTTON
// ================================================================

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(
        label,
        overflow: TextOverflow.ellipsis,
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.textPrimary,
        side: BorderSide(
          color: Colors.white.withValues(
            alpha: 0.10,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}