import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const AnoshaPortfolio());
}

class AnoshaPortfolio extends StatelessWidget {
  const AnoshaPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anosha Ali | Software Engineer',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}