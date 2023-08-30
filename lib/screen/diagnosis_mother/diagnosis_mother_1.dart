import 'package:bridze/screen/diagnosis_mother/diagnosis_mother_2.dart';
import 'package:flutter/material.dart';

class DiagnosisMother1Page extends StatelessWidget {
  const DiagnosisMother1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F6),
      body: Column(
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
                  "Bước 1",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Rowdies',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 30),
            child: Text(
              "첫 번째 언어적 진단을 시작합니다.\n화면에 나오는 문장을 부모님이 읽어주세요",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'BMJUA',
                color: Color(0xff000000),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 30),
            child: Text(
              "Bắt đầu chẩn đoán ngôn ngữ đầu tiên.\nBa mẹ hãy đọc lại những câu trên màn hình đi ạ ",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Sriracha',
                color: Color(0xff8EB5FF),
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
                            builder: (context) =>
                                const DiagnosisMother2Page()));
                  },
                  child: Image.asset("assets/images/arrows.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
