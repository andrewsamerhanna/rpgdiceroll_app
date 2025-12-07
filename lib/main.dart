// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rpgdiceroll_app/data/constants.dart';
import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/views/pages/welcome_page.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

const _kIsDarkModeKey = 'isDarkMode';
const _kLocaleCodeKey = 'localeCode';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  // Load saved theme preference
  final isDarkSaved = prefs.getBool(_kIsDarkModeKey) ?? false;
  isDarkModeSelectedNotifier.value = isDarkSaved;

  // Load saved locale preference
  final savedLocaleCode = prefs.getString(_kLocaleCodeKey);
  appLocaleNotifier.value = _localeFromCode(savedLocaleCode);

  runApp(const DragonFireForgeApp());
}

/// Map stored string codes back to Locale objects
Locale _localeFromCode(String? code) {
  switch (code) {
    case 'zh_Hans_CN':
      return const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
        countryCode: 'CN',
      );
    case 'zh_Hant_TW':
      return const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
        countryCode: 'TW',
      );
    case 'zh_Hant_HK':
      return const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
        countryCode: 'HK',
      );
    case 'es':
      return const Locale('es');
    case 'de':
      return const Locale('de');
    case 'fr':
      return const Locale('fr');
    case 'en':
    default:
      return const Locale('en');
  }
}

class DragonFireForgeApp extends StatelessWidget {
  const DragonFireForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // First listen to locale changes
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocaleNotifier,
      builder: (context, locale, _) {
        // Then listen to dark/light mode changes
        return ValueListenableBuilder<bool>(
          valueListenable: isDarkModeSelectedNotifier,
          builder: (context, isDarkModeSelected, child) {
            return MaterialApp(
              title: 'Dragon Fire Forge',
              debugShowCheckedModeBanner: false,

              // ---------------------------
              // Localization
              // ---------------------------
              locale: locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,

              // ---------------------------
              // Theme
              // ---------------------------
              theme: kLightTheme,
              darkTheme: kDarkTheme,
              themeMode: isDarkModeSelected ? ThemeMode.dark : ThemeMode.light,

              // ---------------------------
              // Home
              // ---------------------------
              home: const WelcomePage(),
            );
          },
        );
      },
    );
  }
}


