import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  int? _selectedAyah;
  int? get selectedAyah => _selectedAyah;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  set selectedAyah(int? id) {
    _selectedAyah = id;
    notifyListeners();
  }

  AudioPlayer advancedPlayer = AudioPlayer();
  changeSelectedAyah(int nu) {
    selectedAyah = nu;
    notifyListeners();
  }

  controllerAudio(String url) async {
    if (!_isPlaying) {
      _isPlaying = true;
      advancedPlayer.play(url);
      advancedPlayer.onPlayerCompletion.listen((event) {
        _isPlaying = false;
        selectedAyah = null;
        notifyListeners();
      });
    } else {
      selectedAyah = null;
      _isPlaying = false;
      advancedPlayer.stop();
      notifyListeners();
    }
  }
}
