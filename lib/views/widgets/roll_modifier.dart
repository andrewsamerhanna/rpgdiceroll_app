import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/data/constants.dart';
import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/l10n/app_localizations.dart';

class RollModifiers extends StatelessWidget {
  const RollModifiers({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Reusable builder for each side (Number of dice / Dice modifier)
    Widget buildCounter({
      required String label,
      required String valueText,
      required VoidCallback onDecrement,
      required VoidCallback onIncrement,
    }) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: textTheme.titleMedium),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              // Use the full width of this section, but keep a bit of padding
              // so buttons don't touch the edges of the section.
              return SizedBox(
                width: constraints.maxWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SquareElevatedButton(
                        icon: Icons.remove,
                        onPressed: onDecrement,
                      ),
                      Flexible(
                        child: Center(
                          child: Text(
                            valueText,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      _SquareElevatedButton(
                        icon: Icons.add,
                        onPressed: onIncrement,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    }

    // Listen to dice count, modifier, and selected die
    return ValueListenableBuilder<int>(
      valueListenable: diceCountNotifier,
      builder: (context, diceCount, _) {
        return ValueListenableBuilder<int>(
          valueListenable: diceModifierNotifier,
          builder: (context, modifier, _) {
            return ValueListenableBuilder<List<bool>>(
              valueListenable: diceSelectionNotifier,
              builder: (context, selectedList, _) {
                final selectedIndex =
                    selectedList.indexWhere((isSelected) => isSelected);

                final diceSuffix = selectedIndex == -1
                    ? 'd'
                    : kDiceLabels[selectedIndex].toLowerCase(); // e.g. d20

                final diceText = '$diceCount$diceSuffix';
                final modifierText =
                    modifier >= 0 ? '+$modifier' : '$modifier';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      // Left: Number of dice
                      Expanded(
                        child: buildCounter(
                          label: AppLocalizations.of(context)!.rollModifierNumberOfDice,
                          valueText: diceText,
                          onDecrement: () {
                            if (diceCount > 0) {
                              diceCountNotifier.value--;
                            }
                          },
                          onIncrement: () {
                            diceCountNotifier.value++;
                          },
                        ),
                      ),

                      // Gap between sections so their buttons don't touch
                      const SizedBox(width: 24),

                      // Right: Dice modifier
                      Expanded(
                        child: buildCounter(
                          label: AppLocalizations.of(context)!.rollModifierDiceModifier,
                          valueText: modifierText,
                          onDecrement: () {
                            diceModifierNotifier.value--;
                          },
                          onIncrement: () {
                            diceModifierNotifier.value++;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _SquareElevatedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SquareElevatedButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Keep the theme, but make the buttons clearly visible:
    // purple background + onPrimary icon for strong contrast
    final Color buttonColor = colorScheme.primary;
    final Color iconColor = colorScheme.onPrimary;

    return SizedBox(
      width: 46,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: buttonColor,
          foregroundColor: iconColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Icon(icon, size: 26, color: iconColor),
      ),
    );
  }
}