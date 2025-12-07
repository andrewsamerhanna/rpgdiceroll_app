// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get widgetTreeTitle => 'Dragon Fire Forge';

  @override
  String get widgetTreeSubtitle =>
      'Wähle einen Würfel und tippe auf Würfeln. Viel Glück!';

  @override
  String get rollSnackbarSelectDice => 'Bitte wähle einen Würfel';

  @override
  String get rollSnackbarInvalidConfig => 'Ungültige Würfelkonfiguration';

  @override
  String get rollSnackbarDiceAboveZero =>
      'Bitte eine Würfelanzahl größer als 0 einstellen';

  @override
  String get rollButtonText => 'Würfeln';

  @override
  String get rollModifierNumberOfDice => 'Anzahl der Würfel';

  @override
  String get rollModifierDiceModifier => 'Würfelmodifikator';

  @override
  String get historyEmpty => 'Noch keine Würfe';

  @override
  String get historyCleared => 'Verlauf gelöscht';

  @override
  String get historyClearButton => 'Verlauf löschen';

  @override
  String get welcomePrefix => 'Willkommen bei';

  @override
  String get welcomeTitle => 'Dragon Fire Forge';

  @override
  String get welcomeTagline => 'Schmiede dein Glück.\nWürfle legendäre Würfel.';

  @override
  String get welcomeContinue => 'Weiter';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsAboutTitle => 'Info';

  @override
  String get settingsAboutBody =>
      'Dragon Fire Forge\n\nEine einfache und intuitive Würfel-App für Pen-&-Paper-Rollenspiele.\n\nErstellt mit Flutter.\nVersion 1.0.0';

  @override
  String get settingsLanguageTitle => 'Sprache';

  @override
  String get settingsLanguageLabel => 'App-Sprache';

  @override
  String get homeTabTabletop => 'TISCH';

  @override
  String get homeTabHistory => 'VERLAUF';
}
