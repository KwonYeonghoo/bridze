import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import '../../widgets/audio_test.dart';

class DiagnosisMother2Page extends StatefulWidget {
  const DiagnosisMother2Page({Key? key}) : super(key: key);

  @override
  State<DiagnosisMother2Page> createState() => _DiagnosisMother2PageState();
}

class _DiagnosisMother2PageState extends State<DiagnosisMother2Page> {
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
      backgroundColor: const Color(0xffEEF3F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Center the entire row containing the image and text
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/book.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "문장을 읽어주세요.",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 30),
            child: Text(
              "우리들은 항상 의상을 입고 지내며 어떤 의상을 선택할지에 대해서도 중요하게 생각합니다.\n이러한 의상은 나름대로 특성들이 있으며 국가, 직업, 쓰임새에 따라서 분류해볼 수 있습니다.\n먼저 국가로 분류해보자면 사리, 한복, 기모노, 치파오 등이 나라를 대표하는 전통의상이 있습니다.\n우리나라의 전통의상인 한복은 품이 큰 바지와 저고리, 치마로 된 색이 고운 의상이며\n저고리는 옷고름을 이용하여 여미는 것이 특징입니다.\n인도의 전통의상인 사리의 특징은 온몸을 덮을 만큼 큰 천으로 몸을 가리는 것이며,\n일본의 전통의상인 기모노는 나누어지지 않은 큰 옷감으로 온몸을 감싼 후 허리를 매는 것이 특징입니다.\n그리고 중국의 전통 의상 치파오는 화려한 장식이 수놓아진 치마에 상의는 목까지 올라와\n 단추로 잠그는 것이 특징입니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'KCC',
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: AudioRecorderWidget(key: Key('audio_recorder8')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Center(
              child: Image.asset(
                'assets/images/mother.png',
                height: 60,
                width: 120,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(0, 0, 40, 40), // Add spacing here
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiagnosisScreen()));
                  },
                  child: Image.asset(
                    "assets/images/finish_blue.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
