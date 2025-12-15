import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/auth/login_page.dart';

void main() {
  runApp(const RePointAuthApp());
}

class RePointAuthApp extends StatelessWidget {
  const RePointAuthApp({super.key});

  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color secondaryGreen = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RePoints',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryGreen,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
          secondary: secondaryGreen,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
