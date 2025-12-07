# 🐉 Dragon Fire Forge
### *Forge your luck. Roll legendary dice.*

Dragon Fire Forge is a beautifully designed, fast, and intuitive **2D RPG dice rolling app** built with Flutter for iOS and Android. It brings classic tabletop dice mechanics to your phone with a clean UI, customizable themes, sound effects, and localization support.

## ✨ Features
- 🎲 **2D Dice Selection**  
  Choose from the standard RPG dice set:  
  **d4, d6, d8, d10, d12, d20, percentile**  
  Tap to select one die type at a time.

- ➕ **Modifiers & Dice Count**  
  Adjust roll quantity and add positive/negative modifiers.

- 📜 **Roll History**  
  View previous rolls or clear your history with one tap.

- 🎵 **Sound Effects**  
  High-quality roll SFX (audio disabled when silent mode is on).

- 🌙 **Dark & Light Mode**  
  Automatically saved and applied using SharedPreferences.

- 🌍 **Multi-Language Support**  
  Includes:
  - English  
  - Simplified Chinese  
  - Traditional Chinese  
  - Spanish  
  - French  
  - German  
  (Fully managed via Flutter’s gen-l10n system.)

- 🧭 **Welcome Screen**  
  Custom illustrated splash/welcome art with automatic timeout.

- ⚙️ **Settings Page**  
  - Change language  
  - Toggle dark mode  
  - App info & version

## 🛠️ Built With
- **Flutter 3.x**
- **Dart**
- **ValueNotifiers + setState**
- **SharedPreferences** (persistent storage)
- **gen_l10n** (Flutter localization system)
- **audioplayers** (sound effects)

## 📁 Project Structure
```
lib/
  data/
    constants.dart
    notifiers.dart
  l10n/
    app_en.arb
    app_zh.arb
    ...
  utils/
    dice_selection_helper.dart
  views/
    pages/
      welcome_page.dart
      home_page.dart
      settings_page.dart
    widgets/
      dice_grid.dart
  main.dart
  widget_tree.dart
```

## 🚀 Running the App
Make sure Flutter is installed:

```
flutter doctor
```

Get dependencies:

```
flutter pub get
```

Run on an emulator or device:

```
flutter run
```

Build Android APK:

```
flutter build apk --release
```

Build iOS IPA (requires macOS + Xcode):

```
flutter build ipa --release
```

## 🔥 Future Enhancements
- Dice animations (shake or bounce before showing result)
- Custom dice skins
- Saved roll presets
- Sharing roll results to chat

## 📄 License
MIT License — free for personal and commercial use.

## 🧑‍💻 Developer
Built with dedication and creativity by **Andrew**
