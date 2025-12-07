import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/data/constants.dart';
import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/utils/audio_helper.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';


class RollButton extends StatelessWidget {
  const RollButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _handleRoll(context),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        child: Text(
          AppLocalizations.of(context)!.rollButtonText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // ----------------------------
  // ROLL LOGIC
  // ----------------------------
  Future<void> _handleRoll(BuildContext context) async {
    final selectedIndex =
        diceSelectionNotifier.value.indexWhere((e) => e == true);

    // 1) Require a dice
    if (selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.rollSnackbarSelectDice)),
      );
      return;
    }

    // 2) Determine dice sides
    final label = kDiceLabels[selectedIndex].toUpperCase();
    int sides;
    String diceFaceLabel;

    if (label == 'PCT' || label == 'D100') {
      sides = 100;
      diceFaceLabel = 'd100';
    } else {
      sides = int.tryParse(label.substring(1)) ?? 0;
      diceFaceLabel = 'd$sides';
    }

    if (sides <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.rollSnackbarInvalidConfig)),
      );
      return;
    }

    // 3) Number of dice
    final count = diceCountNotifier.value;
    if (count <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.rollSnackbarDiceAboveZero),
        ),
      );
      return;
    }

    // 4) Roll them
    final rng = Random();
    final rolls = List<int>.generate(count, (_) => rng.nextInt(sides) + 1);

    // 5) Total
    final rollsTotal = rolls.fold(0, (a, b) => a + b);

    // 6) Modifier
    final modifier = diceModifierNotifier.value;
    final finalTotal = rollsTotal + modifier;

    // 7) Process string
    final rollsPart = rolls.join(' + ');
    final modifierPart = modifier > 0
        ? ' + $modifier'
        : modifier < 0
            ? ' - ${-modifier}'
            : '';
    final processString = '$rollsPart$modifierPart = $finalTotal';

    // 8) Roll type ("3d8 - 3")
    String rollType = '$count$diceFaceLabel';
    if (modifier > 0) rollType += ' + $modifier';
    if (modifier < 0) rollType += ' - ${-modifier}';

    // 9) Store results
    rollResultNotifier.value = finalTotal;
    rollProcessNotifier.value = processString;

    // 10) Add to history
    final history = rollHistoryNotifier.value;
    rollHistoryNotifier.value = [
      RollHistoryEntry(
        timestamp: DateTime.now(),
        rollType: rollType,
        result: finalTotal,
        process: processString,
      ),
      ...history,
    ];
    // ▶️ Play sound effect here
    await AudioHelper.playDiceRoll();
    // 11) Show dialog
    _showResultDialog(
      context: context,
      rollType: rollType,
      finalTotal: finalTotal,
      processString: processString,
    );
  }

  // ----------------------------
  // RESULT DIALOG
  // ----------------------------
  void _showResultDialog({
    required BuildContext context,
    required String rollType,
    required int finalTotal,
    required String processString,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Capture NavigatorState *before* any async gap
    final navigator = Navigator.of(context);

    showDialog<void>(
      context: context,
      barrierDismissible: true, // tap outside closes dialog
      builder: (dialogContext) {
        // AUTODISMISS after 15 seconds using navigator (no BuildContext here)
        Future.delayed(const Duration(seconds: 15), () {
          if (navigator.canPop()) {
            navigator.pop();
          }
        });

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: colorScheme.surface,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),

          // No action buttons — auto close or tap-outside only
          actions: const [],

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Roll type, e.g. "3d8 - 3"
              Text(
                rollType,
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 16),

              // BIG result number
              Text(
                '$finalTotal',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Roll process, e.g. "7 + 2 + 5 - 3 = 11"
              Text(
                processString,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

