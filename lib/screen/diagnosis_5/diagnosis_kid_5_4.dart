// 5~7세 아이의 언어 평가 세 번째 문장이 나옵니다.
// 글씨 하단에 녹음 버튼을 누르고 아이가 화면에 나오는 문장을 따라읽습니다.
// 음성이 녹음됐나 확인 후 다시 들어볼 수 있고, 클릭하면 아이의 언어 평가 점수가 나옵니다.
// 오른쪽 하단에 화살표를 누르면 평가 결과 화면으로 넘어갑니다.

import 'package:flutter/material.dart';
import '../../model/audio_recording.dart';
import '../../model/avr.dart';

class FiveRead4Page extends StatefulWidget {
  const FiveRead4Page({Key? key}) : super(key: key);

  @override
  State<FiveRead4Page> createState() => _FiveRead4PageState();
}

class _FiveRead4PageState extends State<FiveRead4Page> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
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
                    const Text(
                      '오늘 유치원에서 책을 읽었어요.\n책 제목은 백설공주와 일곱난쟁이이었어요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 65,
                        fontFamily: 'KCC',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: AudioRecorderWidget(key: Key('audio_recorder5_3')),
                    ),
                    const Center(
                      child: Score(
                        initialValue: '5_3',
                        number: 3,
                      ),
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
