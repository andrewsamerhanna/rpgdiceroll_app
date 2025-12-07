// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get widgetTreeTitle => 'Dragon Fire Forge';

  @override
  String get widgetTreeSubtitle =>
      'Choisissez un dé et appuyez sur lancer. Bonne chance !';

  @override
  String get rollSnackbarSelectDice => 'Veuillez sélectionner un dé';

  @override
  String get rollSnackbarInvalidConfig => 'Configuration de dé invalide';

  @override
  String get rollSnackbarDiceAboveZero =>
      'Veuillez définir un nombre de dés supérieur à 0';

  @override
  String get rollButtonText => 'Lancer';

  @override
  String get rollModifierNumberOfDice => 'Nombre de dés';

  @override
  String get rollModifierDiceModifier => 'Modificateur de dés';

  @override
  String get historyEmpty => 'Aucun lancer pour le moment';

  @override
  String get historyCleared => 'Historique effacé';

  @override
  String get historyClearButton => 'Effacer l’historique';

  @override
  String get welcomePrefix => 'Bienvenue dans';

  @override
  String get welcomeTitle => 'Dragon Fire Forge';

  @override
  String get welcomeTagline =>
      'Forgez votre chance.\nLancez des dés légendaires.';

  @override
  String get welcomeContinue => 'Continuer';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsAboutTitle => 'À propos';

  @override
  String get settingsAboutBody =>
      'Dragon Fire Forge\n\nUne application simple et intuitive pour lancer des dés dans les jeux de rôle sur table.\n\nRéalisée avec Flutter.\nVersion 1.0.0';

  @override
  String get settingsLanguageTitle => 'Langue';

  @override
  String get settingsLanguageLabel => 'Langue de l’application';

  @override
  String get homeTabTabletop => 'TABLE';

  @override
  String get homeTabHistory => 'HISTORIQUE';
}
