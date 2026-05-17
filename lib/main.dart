import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/game_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const ChkonL7acharApp(),
    ),
  );
}

class ChkonL7acharApp extends StatelessWidget {
  const ChkonL7acharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chkon l 7achar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1B4332), // Deep Moroccan Green
        primaryColor: const Color(0xFFD90429), // Moroccan Red
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD90429),
          primary: const Color(0xFFD90429),
          secondary: const Color(0xFFFFD700), // Gold
          background: const Color(0xFF1B4332),
        ),
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}