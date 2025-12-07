import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();
  static final Random _rng = Random();

  // IMPORTANT: paths are RELATIVE to `assets/` root, NOT including `assets/`
  // pubspec.yaml should contain:
  // flutter:
  //   assets:
  //     - assets/audio/
  static const List<String> _diceSounds = [
    'audio/dice_roll_audio_1.mp3',
    'audio/dice_roll_audio_2.mp3',
    'audio/dice_roll_audio_3.mp3',
  ];

  static Future<void> playDiceRoll() async {
    final soundPath = _diceSounds[_rng.nextInt(_diceSounds.length)];

    // Stop any currently playing sound then play a new one
    await _player.stop();

    // AssetSource expects path relative to `assets/` as declared in pubspec
    await _player.play(AssetSource(soundPath));
  }
}
