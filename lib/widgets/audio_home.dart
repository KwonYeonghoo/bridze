import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioFilePath = 'assets/audios/torizzi_home.mp3';
  bool isPlaying = false;

  Future<void> toggleAudio() async {
    isPlaying = !isPlaying;

    if (isPlaying) {
      await audioPlayer.setSourceUrl(audioFilePath);
      audioPlayer.resume();
    } else {
      audioPlayer.pause();
    }
  }

  void pause() {
    audioPlayer.pause();
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
