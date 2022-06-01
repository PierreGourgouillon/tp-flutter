import 'package:just_audio/just_audio.dart';
import 'package:tp_flutter/music.dart';
import 'package:tp_flutter/utils/globalVariables.dart';

class ManagerPlayer {
  late int _index;
  late Music _currentMusic;
  Music get currentMusic => _currentMusic;
  late AudioPlayer audioPlayer;
  late bool isPlaying;

  ManagerPlayer() {
    _index = 0;
    _currentMusic = myMusicList[_index];
    audioPlayer = AudioPlayer();
    isPlaying = true;
  }

  Music nextMusic() {
    if (_index + 1 < myMusicList.length) {
      _index += 1;
    }
    _currentMusic = myMusicList[_index];
    return _currentMusic;
  }

  Music lastMusic() {
    if (_index - 1 >= 0) {
      _index -= 1;
    }
    _currentMusic = myMusicList[_index];
    return _currentMusic;
  }

  void initAudioMusic() async {
    isPlaying = true;
    await audioPlayer.setAsset(_currentMusic.urlSong);
    await audioPlayer.play();
  }

  void resumeMusic() async {
    isPlaying = true;
    await audioPlayer.play();
  }

  void pauseMusic() async {
    isPlaying = false;
    await audioPlayer.pause();
  }
}
