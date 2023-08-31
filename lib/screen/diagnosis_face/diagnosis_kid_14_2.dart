import 'package:bridze/widgets/audio_kid_13.dart';
import 'package:flutter/material.dart';
import 'package:bridze/screen/diagnosis_face/diagnosis_kid_14_3.dart';

class DiagnosisKid142Page extends StatefulWidget {
  const DiagnosisKid142Page({Key? key}) : super(key: key);

  @override
  State<DiagnosisKid142Page> createState() => _DiagnosisKid142PageState();
}

class _DiagnosisKid142PageState extends State<DiagnosisKid142Page> {
  AudioKid13 myAudioPlayer = AudioKid13(); // Use AudioKid12 class
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer.toggleAudio();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid_2.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/chat.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "đánh giá tình cảm",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "왜 그렇게 생각했어 ?",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'BMJUA',
                          color: Color(0xff000000),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DiagnosisKid143Page(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/camera.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "아이의 표정을 녹화중입니다",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/kid.png',
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
