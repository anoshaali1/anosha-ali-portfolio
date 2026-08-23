import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

// Universal HTML/Web import for Flutter Web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html if (dart.library.io) 'dart:io';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  Future<void> openCV() async {
    try {
      if (kIsWeb) {
        // Load the PDF directly from the Flutter asset bundle
        final ByteData data = await rootBundle.load(AppConstants.cvPath);
        final List<int> bytes = data.buffer.asUint8List();

        // Create a Web Blob and trigger browser download
        final blob = html.Blob([bytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute('download', 'Anosha_Ali_Resume.pdf')
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // Fallback for non-web platforms if needed
        final Uri cvUri = Uri.parse(AppConstants.cvPath);
        await launchUrl(cvUri);
      }
    } catch (e) {
      debugPrint('Error opening CV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 90,
      ),
      color: AppTheme.surface.withValues(alpha: 0.25),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          padding: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primary.withValues(alpha: 0.15),
                AppTheme.secondary.withValues(alpha: 0.08),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppTheme.primary.withValues(alpha: 0.20),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isMobile = constraints.maxWidth < 650;

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _resumeText(),
                    const SizedBox(height: 30),
                    _downloadButton(),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: _resumeText(),
                  ),
                  const SizedBox(width: 30),
                  _downloadButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _resumeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MY RESUME',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Interested in my work?',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'View or download my resume to learn more '
          'about my education, technical skills, '
          'projects and experience.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _downloadButton() {
    return ElevatedButton.icon(
      onPressed: openCV,
      icon: const Icon(
        Icons.download_outlined,
      ),
      label: const Text(
        'Download CV',
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
    );
  }
}