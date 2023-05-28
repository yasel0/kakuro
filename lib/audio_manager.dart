import 'package:audioplayers/audioplayers.dart';

class AudioPlayerManager {
  AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  Future<void> play(String url) async {
    await _player.play(AssetSource('music4.mp4'));
    _isPlaying = true;
  }

  Future<void> pause() async {
    await _player.pause();
    _isPlaying = false;
  }

  Future<void> resume() async {
    await _player.resume();
    _isPlaying = true;
  }

  bool get isPlaying => _isPlaying;
}
