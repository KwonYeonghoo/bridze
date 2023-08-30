import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';

class AudioRecorderWidget extends StatefulWidget {
  const AudioRecorderWidget({Key? key}) : super(key: key);

  @override
  AudioRecorderWidgetState createState() => AudioRecorderWidgetState();
}

class AudioRecorderWidgetState extends State<AudioRecorderWidget> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error Start Recording : $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Error Stopping record: $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error Playing Recording: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: isRecording ? stopRecording : startRecording,
              elevation: 0.0,
              fillColor: Colors.transparent,
              shape: const CircleBorder(),
              child: Icon(
                isRecording ? Icons.stop : Icons.mic,
                color: Colors.red,
                size: 30,
              ),
            ),
            Text(
              isRecording ? '음성을 녹음 중입니다' : '마이크를 눌러 녹음을 시작하세요',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        if (!isRecording)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: playRecording,
                elevation: 0.0,
                fillColor: Colors.transparent,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.play_arrow,
                  size: 30,
                ),
              ),
              const Text(
                '녹음된 음성을 재생합니다',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
      ],
    );
  }
}
