import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const Navbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onExperience,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 850;

        return SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: mobile ? 12 : 35,
              vertical: 14,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: AppTheme.surface.withValues(alpha: 0.94),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.07),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.20),
                  blurRadius: 30,
                ),
              ],
            ),
            child: mobile
                ? _MobileNavbar(
                    onHome: onHome,
                    onAbout: onAbout,
                    onSkills: onSkills,
                    onProjects: onProjects,
                    onExperience: onExperience,
                    onEducation: onEducation,
                    onContact: onContact,
                  )
                : _DesktopNavbar(
                    onHome: onHome,
                    onAbout: onAbout,
                    onSkills: onSkills,
                    onProjects: onProjects,
                    onExperience: onExperience,
                    onEducation: onEducation,
                    onContact: onContact,
                  ),
          ),
        );
      },
    );
  }
}

class _DesktopNavbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const _DesktopNavbar({
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onExperience,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                AppTheme.primary,
                AppTheme.secondary,
              ],
            ).createShader(bounds);
          },
          child: const Text(
            'AA.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        const Spacer(),

        _NavButton(label: 'Home', onTap: onHome),
        _NavButton(label: 'About', onTap: onAbout),
        _NavButton(label: 'Skills', onTap: onSkills),
        _NavButton(label: 'Projects', onTap: onProjects),
        _NavButton(label: 'Experience', onTap: onExperience),
        _NavButton(label: 'Education', onTap: onEducation),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: onContact,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Contact'),
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const _MobileNavbar({
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onExperience,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'AA.',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.menu_rounded,
            color: AppTheme.textPrimary,
          ),
          color: AppTheme.surface,
          onSelected: (value) {
            switch (value) {
              case 'Home':
                onHome();
                break;
              case 'About':
                onAbout();
                break;
              case 'Skills':
                onSkills();
                break;
              case 'Projects':
                onProjects();
                break;
              case 'Experience':
                onExperience();
                break;
              case 'Education':
                onEducation();
                break;
              case 'Contact':
                onContact();
                break;
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: 'Home',
              child: Text('Home'),
            ),
            PopupMenuItem(
              value: 'About',
              child: Text('About'),
            ),
            PopupMenuItem(
              value: 'Skills',
              child: Text('Skills'),
            ),
            PopupMenuItem(
              value: 'Projects',
              child: Text('Projects'),
            ),
            PopupMenuItem(
              value: 'Experience',
              child: Text('Experience'),
            ),
            PopupMenuItem(
              value: 'Education',
              child: Text('Education'),
            ),
            PopupMenuItem(
              value: 'Contact',
              child: Text('Contact'),
            ),
          ],
        ),
      ],
    );
  }
}