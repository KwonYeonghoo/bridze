import 'package:flutter/material.dart';
import 'diagnosis_mother/diagnosis_mother_1.dart';

// ignore: camel_case_types
class DiagnosisMotherPage extends StatelessWidget {
  const DiagnosisMotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(
          238, 243, 246, 1), // Set the background color to light blue
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
                  "đánh giá ngôn ngữ",
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
              "언어 평가를 시작합니다.\n화면에 나오는 문장을 부모님이 그대로 읽어주세요",
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
              "Bắt đầu đánh giá ngôn ngữ.\nBa mẹ hãy đọc lại những câu trên màn hình đi ạ",
              style: TextStyle(
                fontFamily: 'Sriracha',
                fontSize: 40,
                color: Color(0xff8EB5FF),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              top: 30,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiagnosisMother1Page()));
                },
                child: Image.asset("assets/images/right.png")),
          ),
        ],
      ),
    );
  }
}
