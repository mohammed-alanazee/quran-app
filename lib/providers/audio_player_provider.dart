import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  String _url = '';
  String get url => _url;
  set url(String value) {
    _url = value;
    notifyListeners();
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  int? _index;
  int? get index => _index;
  set index(int? value) {
    _index = value;
    notifyListeners();
  }

  AudioPlayer advancedPlayer = AudioPlayer();
  void stopAudio() {
    index = null;
    _isPlaying = false;
    advancedPlayer.stop();
    notifyListeners();
  }

  void playAudio(String urlString) async {
    url = urlString;
    if (!_isPlaying) {
      _isPlaying = true;
      advancedPlayer.play(urlString);
      advancedPlayer.onPlayerCompletion.listen((event) {
        _isPlaying = false;
        index = null;
        notifyListeners();
      });
      notifyListeners();
    } else {
      stopAudio();
    }
  }
}
