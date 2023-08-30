import 'package:bridze/screen/diagnosis.dart';
import 'package:bridze/widgets/audio_kid_13.dart';
import 'package:flutter/material.dart';
import 'diagnosis_kid_14.dart';

class DiagnosisKid13Page extends StatefulWidget {
  const DiagnosisKid13Page({Key? key}) : super(key: key);

  @override
  State<DiagnosisKid13Page> createState() => _DiagnosisKid13PageState();
}

class _DiagnosisKid13PageState extends State<DiagnosisKid13Page> {
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
            'assets/images/diagnosis_kid.png',
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
                      "Bước 4",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 250,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 40, top: 30),
                  child: Text(
                    "왜 그렇게 생각했어~?",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiagnosisKid14Page(),
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
                        "아이의 표정을 녹화 중",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'BMJUA',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0, 0, 40, 40), // Add spacing here
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosisScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/finish_pink.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
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
