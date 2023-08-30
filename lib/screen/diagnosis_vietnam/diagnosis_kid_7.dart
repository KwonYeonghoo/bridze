import 'package:bridze/screen/diagnosis_vietnam/diagnosis_kid_8.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class DiagnosisKid7Page extends StatelessWidget {
  const DiagnosisKid7Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                      "Bước 2-2",
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
                  "첫 번째 언어적 진단을 시작합니다.\n화면에 나오는 문장을 아이가 그대로 읽어주세요 ~",
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
                  "Bắt đầu chẩn đoán ngôn ngữ đầu tiên.\nEm bé đọc y chang câu trên màn hình đi",
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
                            builder: (context) => const DiagnosisKid8Page(),
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
