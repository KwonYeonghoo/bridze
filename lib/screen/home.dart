import 'dart:async';
import 'package:bridze/diagnosis_home_2.dart';
import 'package:flutter/material.dart';
import '../widgets/audio_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  MyAudioPlayer myAudioPlayer = MyAudioPlayer();
  bool isPlaying = false;
  String greetingText =
      '안녕?나는 토리찌야!\n나는 너와 친구가 되고 싶어~\n너에 대해 잘 알고 싶은데\n지금부터 내 질문에 솔직하게 답해줄거지 ?';

  void toggleAudio() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      myAudioPlayer.toggleAudio();
    } else {
      myAudioPlayer.pause();
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 15), _changeGreetingText);
  }

  void _changeGreetingText() {
    setState(() {
      greetingText =
          '첫 번째 놀이는 내가 제시한 문장을 그대로 읽어주면 돼 ~\n두 번째 놀이는 내가 물어보는 질문에 솔직하게 답해줄거지 ~\n밑에 나오는 얼굴 표정과 점수를 보고\n너의 기분을 클릭해줘!';
    });
  }

  @override
  void dispose() {
    myAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: toggleAudio,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/home_image.png',
              fit: BoxFit.cover,
              width: 1440,
              height: 1024,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 480, top: 30.0),
              child: Text("진단 과정",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 70,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: GestureDetector(
                onTap: toggleAudio,
                child: Image.asset(
                  isPlaying
                      ? 'assets/images/quiet.png'
                      : 'assets/images/audio.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: greetingText,
                                style: const TextStyle(
                                  fontFamily: 'KCC',
                                  fontSize: 38,
                                  color: Colors.black,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 30),
                child: GestureDetector(
                  onTap: () {
                    myAudioPlayer.dispose(); // Stop audio on skip image tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiagnosisHome2Page()),
                    );
                  },
                  child: Image.asset('assets/images/skip.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
