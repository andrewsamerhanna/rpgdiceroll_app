import 'package:rpgdiceroll_app/data/notifiers.dart';
import 'package:rpgdiceroll_app/data/constants.dart';

class DiceSelectionHelper {
  /// Selects a dice by index and clears the previous selection.
  static void selectDice(int index) {
    final List<bool> newSelection =
        List<bool>.filled(kDiceLabels.length, false);

    newSelection[index] = true;

    diceSelectionNotifier.value = newSelection;
  }
}
