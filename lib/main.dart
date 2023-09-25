import 'package:cakappramuka/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:cakappramuka/config/colors.dart';

import 'package:cakappramuka/pages/splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(RootApp());

class RootApp extends StatelessWidget {
  RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FToastBuilder(),
      title: 'Cakap Pramuka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.signika(),
          titleLarge: GoogleFonts.signika(),
          bodyMedium: GoogleFonts.signika(),
          displaySmall: GoogleFonts.signika(),
          titleMedium: GoogleFonts.signika(),
          titleSmall: GoogleFonts.signika(),
          bodySmall: GoogleFonts.signika(),
          bodyLarge: GoogleFonts.signika(),
          labelLarge: GoogleFonts.signika(),
        ).apply(
          bodyColor: ThemeColors.primary[600],
          displayColor: Colors.blue,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: ThemeColors.primary,
            background: ThemeColors.primary[100]),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => SafeArea(child: Homepage()),
        '/splash': (context) => SafeArea(child: SplashScreen()),
      },
    );
  }
}
