import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme/app_theme.dart';
import '../data/certifications.dart';
import '../models/certification.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
              // ============================================================
              // SECTION HEADER
              // ============================================================

              const Text(
                'CERTIFICATIONS',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.2,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Certifications & Credentials',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(
                width: 750,
                child: Text(
                  'Professional certifications and continuous learning '
                  'across software engineering, development, cloud, '
                  'AI and modern technologies.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                    height: 1.7,
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // ============================================================
              // RESPONSIVE CERTIFICATION GRID
              // ============================================================

              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  int columns;

                  if (width >= 1050) {
                    columns = 3;
                  } else if (width >= 650) {
                    columns = 2;
                  } else {
                    columns = 1;
                  }

                  const spacing = 22.0;

                  final cardWidth =
                      (width - ((columns - 1) * spacing)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: certifications.map(
                      (certification) {
                        return SizedBox(
                          width: cardWidth,
                          child: _CertificationCard(
                            certification: certification,
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

// ============================================================================
// CERTIFICATION CARD
// ============================================================================

class _CertificationCard extends StatefulWidget {
  final Certification certification;

  const _CertificationCard({
    required this.certification,
  });

  @override
  State<_CertificationCard> createState() =>
      _CertificationCardState();
}

class _CertificationCardState
    extends State<_CertificationCard> {
  bool isHovered = false;

  bool get hasValidUrl {
    final url = widget.certification.credentialUrl;

    return url.isNotEmpty &&
        url != 'YOUR_REAL_LINK' &&
        url.startsWith('http');
  }

  // ========================================================================
  // OPEN CREDENTIAL
  // ========================================================================

  Future<void> _openCredential() async {
    if (!hasValidUrl) return;

    final uri = Uri.parse(
      widget.certification.credentialUrl,
    );

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      // Prevent application crash if URL cannot be opened.
    }
  }

  // ========================================================================
  // SHOW CERTIFICATE
  // ========================================================================

  void _showCertificate(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                  maxHeight: 750,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 4,
                  child: Image.asset(
                    widget.certification.image,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return const SizedBox(
                        height: 400,
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons
                                    .image_not_supported_outlined,
                                color: AppTheme.primary,
                                size: 50,
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Certificate image could not be loaded.',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // CLOSE BUTTON
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
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

  // ========================================================================
  // BUILD
  // ========================================================================

  @override
  Widget build(BuildContext context) {
    final certification = widget.certification;

    return MouseRegion(
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
            ? (Matrix4.identity()..translate(0.0, -5.0))
            : Matrix4.identity(),

        decoration: BoxDecoration(
          color: AppTheme.surface,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: isHovered
                ? AppTheme.primary.withValues(alpha: 0.40)
                : Colors.white.withValues(alpha: 0.06),
          ),

          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(
                      alpha: 0.10,
                    ),
                    blurRadius: 28,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),

        clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // CERTIFICATE IMAGE
            // ==============================================================

            GestureDetector(
              onTap: () => _showCertificate(context),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.55,
                    child: Image.asset(
                      certification.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.background,
                          child: const Center(
                            child: Icon(
                              Icons
                                  .image_not_supported_outlined,
                              color: AppTheme.primary,
                              size: 42,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // IMAGE OVERLAY
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration:
                          const Duration(milliseconds: 200),
                      color: isHovered
                          ? Colors.black.withValues(
                              alpha: 0.12,
                            )
                          : Colors.transparent,
                    ),
                  ),

                  // VIEW BADGE
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(
                          alpha: 0.70,
                        ),
                        borderRadius:
                            BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ==============================================================
            // CARD CONTENT
            // ==============================================================

            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // VERIFIED ICON
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppTheme.primary
                              .withValues(alpha: 0.10),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.verified_outlined,
                          color: AppTheme.primary,
                          size: 21,
                        ),
                      ),

                      const Spacer(),

                      if (hasValidUrl)
                        const Icon(
                          Icons.open_in_new_rounded,
                          color: AppTheme.textSecondary,
                          size: 18,
                        ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // TITLE
                  Text(
                    certification.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ISSUER
                  Text(
                    certification.issuer,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 7),

                  // DATE
                  Text(
                    certification.date,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ========================================================
                  // ACTION BUTTONS
                  // ========================================================

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _showCertificate(context);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                AppTheme.textPrimary,
                            side: BorderSide(
                              color: AppTheme.primary
                                  .withValues(alpha: 0.35),
                            ),
                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'View Certificate',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      if (hasValidUrl) ...[
                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: _openCredential,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppTheme.primary,
                              foregroundColor:
                                  Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Credential',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}