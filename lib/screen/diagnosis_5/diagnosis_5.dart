import 'package:bridze/screen/diagnosis_5/diagnosis_kid_5_2.dart';
import 'package:flutter/material.dart';

class FivePage extends StatefulWidget {
  final String name;

  const FivePage({Key? key, required this.name}) : super(key: key);

  @override
  State<FivePage> createState() => FivePageState();
}

class FivePageState extends State<FivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/diagnosis_kid.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/glasses.png',
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
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "${widget.name} 어린이의 언어 평가를 시작합니다.\n화면에 나오는 문장을 아이가 그대로 읽어주세요 ~",
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'BMJUA',
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "Bắt đầu đánh giá ngôn ngữ.\nEm bé đọc y chang câu trên màn hình đi",
                  style: TextStyle(
                    fontFamily: 'Sriracha',
                    fontSize: 40,
                    color: Color(0xff8EB5FF),
                  ),
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
                            builder: (context) => const FiveRead2Page(),
                          ),
                        );
                      },
                      child: Image.asset("assets/images/cursor.png",
                          width: 100, height: 100),
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
