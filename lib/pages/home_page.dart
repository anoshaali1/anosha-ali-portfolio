import 'package:flutter/material.dart';

import '../widgets/animated_background.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/what_i_do_section.dart';
import '../widgets/tech_stack_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/education_section.dart';
import '../widgets/certifications_section.dart';
import '../widgets/achievements_section.dart';
import '../widgets/resume_section.dart';
import '../widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey certificationsKey = GlobalKey();
  final GlobalKey achievementsKey = GlobalKey();
  final GlobalKey resumeKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final BuildContext? context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.04,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    key: heroKey,
                    child: HeroSection(
                      onProjects: () => scrollTo(projectsKey),
                      onContact: () => scrollTo(contactKey),
                    ),
                  ),

                  Container(
                    key: aboutKey,
                    child: const AboutSection(),
                  ),

                  Container(
                    key: servicesKey,
                    child: const WhatIDoSection(),
                  ),

                  Container(
                    key: skillsKey,
                    child: const TechStackSection(),
                  ),

                  Container(
                    key: projectsKey,
                    child: const ProjectsSection(),
                  ),

                  Container(
                    key: experienceKey,
                    child: const ExperienceSection(),
                  ),

                  Container(
                    key: educationKey,
                    child: const EducationSection(),
                  ),

                  Container(
                    key: certificationsKey,
                    child: const CertificationsSection(),
                  ),

                  Container(
                    key: achievementsKey,
                    child: const AchievementsSection(),
                  ),

                  Container(
                    key: resumeKey,
                    child: const ResumeSection(),
                  ),

                  Container(
                    key: contactKey,
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),

            Navbar(
              onHome: () => scrollTo(heroKey),
              onAbout: () => scrollTo(aboutKey),
              onSkills: () => scrollTo(skillsKey),
              onProjects: () => scrollTo(projectsKey),
              onExperience: () => scrollTo(experienceKey),
              onEducation: () => scrollTo(educationKey),
              onContact: () => scrollTo(contactKey),
            ),
          ],
        ),
      ),
    );
  }
}