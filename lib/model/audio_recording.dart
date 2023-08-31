// 음성 녹음, 재생 및 변환 기능을 제공하는 위젯입니다.
// 녹음된 음성은 FLAC 형식으로 저장됩니다.
// 저장된 음성을 서버로 업로드합니다.
// stt 모델의 결과를 받아 다시 출력합니다.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

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
  String stt = '';

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

  // 녹음 시작 함수
  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start(
          encoder: AudioEncoder.flac,
        );
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error Start Recording : $e');
    }
  }

  // 녹음 중지 함수
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

  // 음성 파일 업로드 및 변환 함수
  Future<void> audioupload() async {
    try {
      http.Response aresponse = await http.get(
        Uri.parse(audioPath),
      );

      if (aresponse.statusCode == 200) {
        var request = http.MultipartRequest(
          "POST",
          Uri.parse("https://daitso.run.goorm.site/audio"),
        );

        var audio = http.MultipartFile.fromBytes(
          'audio',
          aresponse.bodyBytes,
          filename: 'test.flac',
        );

        request.files.add(audio);

        // respond
        var response = await request.send();
        var responseData = await response.stream.toBytes();
        var result = utf8.decode(responseData);
        print('stt: $result');
      } else {
        print('HTTP Error: ${aresponse.statusCode}');
        setState(() {
          stt = '음성 변환 중에 문제가 발생했습니다.' 'HTTP Error: ${aresponse.statusCode}';
        });
      }
    } catch (e) {
      print('Exception during HTTP request: $e');
      setState(() {
        stt = '음성 변환 중에 문제가 발생했습니다.' 'Exception during HTTP request: $e';
      });
    }
  }

  // 음성 파일 재생 함수
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
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
              ),
            ),
          ],
        ),
        if (!isRecording)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  audioupload();
                  playRecording();
                },
                elevation: 0.0,
                fillColor: Colors.transparent,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.touch_app_sharp,
                  size: 30,
                ),
              ),
              const Text(
                '음성 재생 하기',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'BMJUA',
                ),
              ),
            ],
          ),
        Text(
          stt,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
