import 'dart:async';
import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import '../../widgets/audio_test.dart';

class FiveReadPage extends StatefulWidget {
  const FiveReadPage({Key? key}) : super(key: key);

  @override
  State<FiveReadPage> createState() => _FiveReadPageState();
}

class _FiveReadPageState extends State<FiveReadPage> {
  bool showPlayer = false;
  String? audioPath;
  List<String> greetingTextList = [
    '엄마 하늘만큼 땅만큼 사랑해요.\n오늘도 같이 놀아줘서 고마워요.',
    '아이바오가 푸바오를 핥아줬어요.\n그리고 푸바오는 판다 랜드에 살아요.',
    '오늘 유치원에서 책을 읽었어요.\n책 제목은 백설공주와 일곱난쟁이이었어요.'
  ];
  int currentGreetingIndex = 0;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
    _startChangingGreetingText();
  }

  void _startChangingGreetingText() {
    Timer.periodic(const Duration(seconds: 15), (timer) {
      setState(() {
        currentGreetingIndex =
            (currentGreetingIndex + 1) % greetingTextList.length;
      });
    });
  }

  String getCurrentGreetingText() {
    return greetingTextList[currentGreetingIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/diagnosis_kid.png",
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/book.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "따라해볼까요?",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'BMJUA',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      getCurrentGreetingText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 75,
                        fontFamily: 'KCC',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: AudioRecorderWidget(key: Key('audio_recorder5')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Image.asset(
                        'assets/images/kid.png',
                        width: 100,
                        height: 100,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
