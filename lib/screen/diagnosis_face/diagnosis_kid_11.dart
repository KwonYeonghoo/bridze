import 'package:bridze/screen/diagnosis_face/diagnosis_kid_12.dart';
import 'package:flutter/material.dart';

class DiagnosisKid11Page extends StatelessWidget {
  const DiagnosisKid11Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid_2.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
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
                      'assets/images/chat.png',
                      height: 45,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Bước 4",
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
                  "비언어적 진단을 시작합니다.\n토리찌에게 솔직하게 답해주세요~",
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
                  "Bắt đầu chẩn đoán phi ngôn ngữ.\nHãy trả lời câu hỏi của thỏ một cách thành thật nhé",
                  style: TextStyle(
                    fontFamily: 'Sriracha',
                    fontSize: 40,
                    color: Color(0xff8EB5FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(width: 10),
                    ],
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
                            builder: (context) => const DiagnosisKid12Page(),
                          ),
                        );
                      },
                      child: Image.asset("assets/images/cursor.png"),
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
