import 'package:bridze/diagnosis_face2/diagnosis_happy_1.dart';
import 'package:flutter/material.dart';

class DiagnosisKid20Page extends StatelessWidget {
  const DiagnosisKid20Page({Key? key, required String avrScore})
      : super(key: key);

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
                      "đánh giá tình cảm",
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
                  "토리찌와 표정 놀이를 시작해봅시다 !\n토리찌가 제시하는 감정을 표정으로 마음껏 표현해보세요.",
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
                  "Chúng ta hãy bắt đầu trò chơi biểu cảm với thỏ nào !\nHãy thể hiện hết mình cảm xúc của thỏ bằng biểu cảm nhé",
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
                            builder: (context) => const DiagnosisHappy1Page(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/cursor.png",
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
