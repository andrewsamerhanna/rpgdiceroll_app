// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get widgetTreeTitle => 'Dragon Fire Forge';

  @override
  String get widgetTreeSubtitle =>
      'Elige un dado y pulsa lanzar. ¡Buena suerte!';

  @override
  String get rollSnackbarSelectDice => 'Por favor, selecciona un dado';

  @override
  String get rollSnackbarInvalidConfig => 'Configuración de dados no válida';

  @override
  String get rollSnackbarDiceAboveZero =>
      'Establece un número de dados mayor que 0';

  @override
  String get rollButtonText => 'Lanzar';

  @override
  String get rollModifierNumberOfDice => 'Número de dados';

  @override
  String get rollModifierDiceModifier => 'Modificador de dados';

  @override
  String get historyEmpty => 'Todavía no hay tiradas';

  @override
  String get historyCleared => 'Historial borrado';

  @override
  String get historyClearButton => 'Borrar historial';

  @override
  String get welcomePrefix => 'Bienvenido a';

  @override
  String get welcomeTitle => 'Dragon Fire Forge';

  @override
  String get welcomeTagline => 'Forja tu suerte.\nLanza dados legendarios.';

  @override
  String get welcomeContinue => 'Continuar';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsAboutTitle => 'Acerca de';

  @override
  String get settingsAboutBody =>
      'Dragon Fire Forge\n\nUna aplicación sencilla e intuitiva para tirar dados en juegos de rol de mesa.\n\nCreada con Flutter.\nVersión 1.0.0';

  @override
  String get settingsLanguageTitle => 'Idioma';

  @override
  String get settingsLanguageLabel => 'Idioma de la aplicación';

  @override
  String get homeTabTabletop => 'MESA';

  @override
  String get homeTabHistory => 'HISTORIAL';
}
