import 'package:bridze/model/crr_3.dart';
import 'package:flutter/material.dart';
import '../../model/audio_recording.dart';

class ElevenReadPage extends StatefulWidget {
  const ElevenReadPage({Key? key}) : super(key: key);

  @override
  State<ElevenReadPage> createState() => _ElevenReadPageState();
}

class _ElevenReadPageState extends State<ElevenReadPage> {
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
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Text(
                  "직업으로 분류해보자면 요리사, 소방관, 경찰관 등의 사람들이 근무할 때 입는 의상으로\n나눌 수 있습니다.\n요리사는 요리를 할 때 몸에 붙어 있는 이물질이 요리에 들어가는 것을 방지하기 위해 가운을 입습니다.\n소방관은 위험한 상황에 노출되어 있으며 화염 속에서 불이 몸에 붙는 것을 막기 위해\n소방관복을 입어 몸을 화상으로부터 보호합니다.\n마지막으로 경찰관은 사람들에게 범죄나 불법적인 일에 대한 경각심을 일으키기 위해\n경찰복을 입어서 특별한 경찰관의 신분을 나타냅니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'KCC',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: AudioRecorderWidget(
                  key: Key('audio_recorder11'),
                ),
              ),
              const Center(
                child: Score4(
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
