// 8~10세 아이의 언어 평가 문장이 나옵니다.
// 글씨 하단에 녹음 버튼을 누르고 아이가 화면에 나오는 문장을 따라읽습니다.
// 음성이 녹음됐나 확인 후 다시 들어볼 수 있고, 클릭하면 아이의 언어 평가 점수가 나옵니다.
// 오른쪽 하단에 화살표를 누르면 평가 결과 화면으로 넘어갑니다.

import 'package:flutter/material.dart';
import '../../model/audio_recording.dart';
import '../../model/crr_2.dart';

class EightReadPage extends StatefulWidget {
  const EightReadPage({Key? key}) : super(key: key);

  @override
  State<EightReadPage> createState() => _EightReadPageState();
}

class _EightReadPageState extends State<EightReadPage> {
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
              const SizedBox(height: 20),
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
                      "đánh giá ngôn ngữ",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "김밥을 만들기 위해 필요한 재료를 준비한다.\n먼저 김을 깔고 밥을 잘 펴준다.\n그리고 단무지와 살짝 볶은 오이와 당근을 길게 썰어 얹어준다.\n햄도 볶아서 올리고 계란은 넓게 부친다.\n계란이 익으면 칼로 썰어 얹어준다.\n발로 터지지 않도록 잘 말아 손바닥으로 꾹꾹 눌러준다.\n그리고 김밥을 도마 위에 올려 놓고 칼로 한입크기로 썬다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'KCC',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: AudioRecorderWidget(
                key: Key('audio_recorder8'),
              )),
              const Center(
                child: Score3(
                  initialValue: '8',
                  number: 0,
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/kid.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
