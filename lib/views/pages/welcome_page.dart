import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/views/widget_tree.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer? _autoTimer;

  @override
  void initState() {
    super.initState();

    // Auto navigate to WidgetTree after 20 seconds
    _autoTimer = Timer(const Duration(seconds: 20), _goToWidgetTree);
  }

  void _goToWidgetTree() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WidgetTree()),
    );
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),

          // Subtle dark overlay for text readability
          Container(
            color: Colors.black.withValues(alpha: 0.45),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                Text(
                  AppLocalizations.of(context)!.welcomePrefix,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: 8),

                Text(
                  AppLocalizations.of(context)!.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.amber[300],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                ),
                const SizedBox(height: 16),

                Text(
                  AppLocalizations.of(context)!.welcomeTagline,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                ),

                const Spacer(flex: 3),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _goToWidgetTree,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.welcomeContinue,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
