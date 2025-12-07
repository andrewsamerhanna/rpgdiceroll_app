import 'package:flutter/material.dart';

const List<String> kDiceLabels = [
  'D4',
  'D6',
  'D8',
  'D10',
  'D12',
  'D20',
  'D100',
];

const List<String> kDiceImagePaths = [
  'assets/images/d4.png',
  'assets/images/d6.png',
  'assets/images/d8.png',
  'assets/images/d10.png',
  'assets/images/d12.png',
  'assets/images/d20.png',
  'assets/images/d100.png',
];

//
// --------------------------------------------------------
// DRAGON FIRE FORGE — LIGHT THEME
// Ember / Burnt Copper / Warm Parchment
// --------------------------------------------------------
//
final ThemeData kLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme.light(
    primary: Color(0xFFB53A21),          // Blacksmith Ember
    onPrimary: Colors.white,

    primaryContainer: Color(0xFFD8843E), // Burnt Copper
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFD8843E),        // Burnt Copper
    onSecondary: Colors.white,

    secondaryContainer: Color(0xFFEAC67A), // Glowing Gold
    onSecondaryContainer: Color(0xFF2B1F00),

    surface: Color(0xFFF5F2EC),          // Warm parchment
    onSurface: Color(0xFF111111),

    error: Color(0xFFB00020),
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: const Color(0xFFF5F2EC),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF111111),
    elevation: 1,
    shadowColor: Colors.black12,
  ),

  cardTheme: const CardThemeData(
    elevation: 1,
    margin: EdgeInsets.zero,
  ),

  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
);

//
// --------------------------------------------------------
// DRAGON FIRE FORGE — DARK THEME
// Obsidian / Oiled Iron / Gold / Ember
// --------------------------------------------------------
//
final ThemeData kDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD8843E),          // Burnt Copper
    onPrimary: Colors.black,

    primaryContainer: Color(0xFFB53A21), // Deep Ember
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFEAC67A),        // Glowing Gold
    onSecondary: Colors.black,

    secondaryContainer: Color(0xFFA67C00),
    onSecondaryContainer: Colors.white,

    surface: Color(0xFF181818),          // Oiled Iron
    onSurface: Colors.white,

    error: Color(0xFFCF6679),
    onError: Colors.black,
  ),

  scaffoldBackgroundColor: const Color(0xFF0F0F0F), // Obsidian

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF181818),
    foregroundColor: Colors.white,
    elevation: 1,
    shadowColor: Colors.black54,
  ),

  cardTheme: const CardThemeData(
    color: Color(0xFF181818),
    elevation: 1,
    margin: EdgeInsets.zero,
  ),

  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
);