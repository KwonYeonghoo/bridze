import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import '../../widgets/audio_test.dart';

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
                      "Bước 2",
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
              const Text(
                "김밥을 만들기 위해 필요한 재료를 준비한다.\n먼저 김을 깔고 밥을 잘 펴준다.\n그리고 단무지와 살짝 볶은 오이와 당근을 길게 썰어 얹어준다.\n햄도 볶아서 올리고 계란은 넓게 부친다.\n계란이 익으면 칼로 썰어 얹어준다.\n발로 터지지 않도록 잘 말아 손바닥으로 꾹꾹 눌러준다.\n그리고 김밥을 도마 위에 올려 놓고 칼로 한입크기로 썬다.",
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'KCC',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: AudioRecorderWidget(
                  key: Key('audio_recorder8'),
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
