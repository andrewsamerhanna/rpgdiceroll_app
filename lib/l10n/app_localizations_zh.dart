// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get widgetTreeTitle => '龙火锻造坊';

  @override
  String get widgetTreeSubtitle => '选择一个骰子并点击掷骰。祝你好运！';

  @override
  String get rollSnackbarSelectDice => '请选择一个骰子';

  @override
  String get rollSnackbarInvalidConfig => '无效的骰子配置';

  @override
  String get rollSnackbarDiceAboveZero => '请将骰子数量设置为大于 0';

  @override
  String get rollButtonText => '掷骰';

  @override
  String get rollModifierNumberOfDice => '骰子数量';

  @override
  String get rollModifierDiceModifier => '骰子修正值';

  @override
  String get historyEmpty => '暂无掷骰记录';

  @override
  String get historyCleared => '历史记录已清除';

  @override
  String get historyClearButton => '清除历史';

  @override
  String get welcomePrefix => '欢迎来到';

  @override
  String get welcomeTitle => '龙火锻造坊';

  @override
  String get welcomeTagline => '锻造你的幸运。\n掷出传奇骰子。';

  @override
  String get welcomeContinue => '继续';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsAboutTitle => '关于';

  @override
  String get settingsAboutBody =>
      '龙火锻造坊\n\n一款简单直观的桌面 RPG 掷骰应用。\n\n使用 Flutter 构建。\n版本 1.0.0';

  @override
  String get settingsLanguageTitle => '语言';

  @override
  String get settingsLanguageLabel => '应用语言';

  @override
  String get homeTabTabletop => '桌面';

  @override
  String get homeTabHistory => '历史';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get widgetTreeTitle => '龍火鍛造坊';

  @override
  String get widgetTreeSubtitle => '選擇一顆骰子並點擊擲骰。祝你好運！';

  @override
  String get rollSnackbarSelectDice => '請選擇一顆骰子';

  @override
  String get rollSnackbarInvalidConfig => '無效的骰子設定';

  @override
  String get rollSnackbarDiceAboveZero => '請將骰子數量設定為大於 0';

  @override
  String get rollButtonText => '擲骰';

  @override
  String get rollModifierNumberOfDice => '骰子數量';

  @override
  String get rollModifierDiceModifier => '骰子修正值';

  @override
  String get historyEmpty => '尚無擲骰紀錄';

  @override
  String get historyCleared => '歷史紀錄已清除';

  @override
  String get historyClearButton => '清除歷史';

  @override
  String get welcomePrefix => '歡迎來到';

  @override
  String get welcomeTitle => '龍火鍛造坊';

  @override
  String get welcomeTagline => '鍛造你的幸運。\n擲出傳奇骰子。';

  @override
  String get welcomeContinue => '繼續';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsAboutTitle => '關於';

  @override
  String get settingsAboutBody =>
      '龍火鍛造坊\n\n一款簡單直覺的桌上型 RPG 擲骰應用程式。\n\n使用 Flutter 建置。\n版本 1.0.0';

  @override
  String get settingsLanguageTitle => '語言';

  @override
  String get settingsLanguageLabel => '應用程式語言';

  @override
  String get homeTabTabletop => '桌面';

  @override
  String get homeTabHistory => '歷史';
}
