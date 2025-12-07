// lib/widget_tree.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/views/pages/home_page.dart';
import 'package:rpgdiceroll_app/views/pages/settings_page.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

const _kIsDarkModeKey = 'isDarkMode';

final List<Widget> pages = [
  const HomePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  Future<void> _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !isDarkModeSelectedNotifier.value;
    isDarkModeSelectedNotifier.value = newValue;
    await prefs.setBool(_kIsDarkModeKey, newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.widgetTreeTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              AppLocalizations.of(context)!.widgetTreeSubtitle,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            )
          ],
        ),
        actions: [
          // Example: theme toggle icon
          ValueListenableBuilder<bool>(
            valueListenable: isDarkModeSelectedNotifier,
            builder: (context, isDark, _) {
              return IconButton(
                icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                onPressed: _toggleTheme,
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),

      // PAGE SWITCHER (Currently only HomePage exists)
      body: ValueListenableBuilder<int>(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
    );
  }
}
