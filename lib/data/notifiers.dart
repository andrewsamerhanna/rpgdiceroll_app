import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/data/constants.dart';

// stores which page is currently selected
ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);

// Stores whether dark mode is selected or not
ValueNotifier<bool> isDarkModeSelectedNotifier = ValueNotifier(false);


// Holds which dice is selected. Only one `true` at a time.
final ValueNotifier<List<bool>> diceSelectionNotifier =
    ValueNotifier<List<bool>>(
  List<bool>.filled(kDiceLabels.length, false),
);

// Stores the number of dice (cannot be negative)
final ValueNotifier<int> diceCountNotifier = ValueNotifier<int>(1);

// Stores the modifier value (can be negative or positive)
final ValueNotifier<int> diceModifierNotifier = ValueNotifier<int>(0);

// Stores the final numeric result of the last roll.
final ValueNotifier<int?> rollResultNotifier = ValueNotifier<int?>(null);

// Stores a string describing the roll process,
// e.g. "7 + 2 + 5 - 3 = 11"
final ValueNotifier<String?> rollProcessNotifier = ValueNotifier<String?>(null);

// History entry model
class RollHistoryEntry {
  final DateTime timestamp;
  final String rollType;   // e.g. "3d8 - 3"
  final int result;        // e.g. 11
  final String process;    // e.g. "7 + 2 + 5 - 3 = 11"

  RollHistoryEntry({
    required this.timestamp,
    required this.rollType,
    required this.result,
    required this.process,
  });
}

// List of all roll history entries (latest first).
final ValueNotifier<List<RollHistoryEntry>> rollHistoryNotifier =
    ValueNotifier<List<RollHistoryEntry>>([]);

/// Controls the current app locale (language).
/// Default = English.
final ValueNotifier<Locale> appLocaleNotifier = ValueNotifier<Locale>(
  const Locale('en'),
);
