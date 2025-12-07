import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

const _kLocaleCodeKey = 'localeCode';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Define supported language options (label + locale + code to store)
    const languageOptions = <_LanguageOption>[
      _LanguageOption(
        label: 'English',
        locale: Locale('en'),
        code: 'en',
      ),
      _LanguageOption(
        label: '中文 (简体)',
        locale: Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hans',
          countryCode: 'CN',
        ),
        code: 'zh_Hans_CN',
      ),
      _LanguageOption(
        label: '中文 (繁體 - 台灣)',
        locale: Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'TW',
        ),
        code: 'zh_Hant_TW',
      ),
      _LanguageOption(
        label: '中文 (繁體 - 香港)',
        locale: Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'HK',
        ),
        code: 'zh_Hant_HK',
      ),
      _LanguageOption(
        label: 'Español',
        locale: Locale('es'),
        code: 'es',
      ),
      _LanguageOption(
        label: 'Deutsch',
        locale: Locale('de'),
        code: 'de',
      ),
      _LanguageOption(
        label: 'Français',
        locale: Locale('fr'),
        code: 'fr',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsAboutTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // ---------------- About Card ----------------
            Text(
              AppLocalizations.of(context)!.settingsAboutTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: colorScheme.shadow.withValues(alpha: 0.1),
                  ),
                ],
              ),
              child: Text(
                AppLocalizations.of(context)!.settingsAboutBody,
                style: textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 32),

            // ---------------- Language Section ----------------
            Text(
              AppLocalizations.of(context)!.settingsLanguageTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            ValueListenableBuilder<Locale>(
              valueListenable: appLocaleNotifier,
              builder: (context, currentLocale, _) {
                // Find which option matches the current locale
                final selectedOption = languageOptions.firstWhere(
                  (opt) => _localesEqual(opt.locale, currentLocale),
                  orElse: () => languageOptions.first,
                );

                return DropdownButtonFormField<String>(
                  initialValue: selectedOption.label,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.settingsLanguageLabel,
                    labelStyle: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  items: languageOptions
                      .map(
                        (opt) => DropdownMenuItem<String>(
                          value: opt.label,
                          child: Text(opt.label),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedLabel) async {
                    if (selectedLabel == null) return;

                    final newOption = languageOptions.firstWhere(
                      (opt) => opt.label == selectedLabel,
                    );

                    // Update the app locale via notifier
                    appLocaleNotifier.value = newOption.locale;

                    // Persist selection
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString(_kLocaleCodeKey, newOption.code);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal helper class for language options
class _LanguageOption {
  final String label;
  final Locale locale;
  final String code;

  const _LanguageOption({
    required this.label,
    required this.locale,
    required this.code,
  });
}

// Helper to compare Locale objects safely
bool _localesEqual(Locale a, Locale b) {
  return a.languageCode == b.languageCode &&
      (a.scriptCode ?? '') == (b.scriptCode ?? '') &&
      (a.countryCode ?? '') == (b.countryCode ?? '');
}
