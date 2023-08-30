import 'package:audioplayers/audioplayers.dart';

class AudioKid13 {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioFilePath = 'assets/audios/audiokid13.mp3';
  bool isPlaying = false;

  Future<void> initAudio() async {
    await audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  Future<void> toggleAudio() async {
    isPlaying = !isPlaying;

    if (isPlaying) {
      await audioPlayer.setSourceUrl(audioFilePath);
      audioPlayer.resume();
    } else {
      audioPlayer.pause();
    }
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
