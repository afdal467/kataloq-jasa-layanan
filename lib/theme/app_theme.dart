import 'package:flutter/material.dart';

class AppTheme {
  static const Color navy = Color(0xFF102A43);
  static const Color blue = Color(0xFF1976D2);
  static const Color brightBlue = Color(0xFF42A5F5);
  static const Color background = Color(0xFFF5F8FC);
  static const Color mutedText = Color(0xFF627D98);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          primary: blue,
          secondary: brightBlue,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: navy,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: navy,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
          ),
          titleLarge: TextStyle(
            color: navy,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.35,
          ),
          titleMedium: TextStyle(color: navy, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(color: mutedText, height: 1.45),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          hintStyle: const TextStyle(color: Color(0xFF9AA9BA), fontSize: 14),
          prefixIconColor: mutedText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE4EBF3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: brightBlue, width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: const Color(0xFF102A43).withOpacity(.08),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 74,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFDCEEFF),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
        ),
      );
}
