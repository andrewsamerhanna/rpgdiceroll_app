import 'package:flutter/material.dart';
import 'package:rpgdiceroll_app/data/constants.dart';
import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/utils/dice_selection_helper.dart';

class DiceGrid extends StatelessWidget {
  const DiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final primary = colorScheme.primary;

    return ValueListenableBuilder<List<bool>>(
      valueListenable: diceSelectionNotifier,
      builder: (context, selectedList, _) {
        return GridView.builder(
          itemCount: kDiceLabels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final bool isOn = selectedList[index];

            return Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () => DiceSelectionHelper.selectDice(index),
                borderRadius: BorderRadius.circular(16),

                splashColor: primary.withValues(alpha: 0.25),
                highlightColor: Colors.transparent,

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isOn
                        ? primary
                        : Colors.transparent,
                  ),

                  // ⬇️ UPDATED CHILD WIDGET (Image + Label)
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Image.asset(
                          kDiceImagePaths[index],
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        kDiceLabels[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isOn
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurface.withValues(alpha: 0.85),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
