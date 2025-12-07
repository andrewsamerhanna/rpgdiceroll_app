// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get widgetTreeTitle => 'Dragon Fire Forge';

  @override
  String get widgetTreeSubtitle => 'Select a dice and click roll. Good Luck!';

  @override
  String get rollSnackbarSelectDice => 'Please select a dice';

  @override
  String get rollSnackbarInvalidConfig => 'Invalid dice configuration';

  @override
  String get rollSnackbarDiceAboveZero => 'Please set number of dice above 0';

  @override
  String get rollButtonText => 'Roll';

  @override
  String get rollModifierNumberOfDice => 'Number of dice';

  @override
  String get rollModifierDiceModifier => 'Dice modifier';

  @override
  String get historyEmpty => 'No rolls yet';

  @override
  String get historyCleared => 'History cleared';

  @override
  String get historyClearButton => 'Clear history';

  @override
  String get welcomePrefix => 'Welcome to';

  @override
  String get welcomeTitle => 'Dragon Fire Forge';

  @override
  String get welcomeTagline => 'Forge your luck.\nRoll legendary dice.';

  @override
  String get welcomeContinue => 'Continue';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAboutTitle => 'About';

  @override
  String get settingsAboutBody =>
      'Dragon Fire Forge\n\nA simple and intuitive dice rolling app for tabletop RPGs.\n\nBuilt with Flutter.\nVersion 1.0.0';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get settingsLanguageLabel => 'App language';

  @override
  String get homeTabTabletop => 'TABLETOP';

  @override
  String get homeTabHistory => 'HISTORY';
}
