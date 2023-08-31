import 'package:bridze/screen/diagnosis_face/diagnosis_kid_14_1.dart';
import 'package:flutter/material.dart';
import '../../model/video.dart';

class DiagnosisKid133Page extends StatelessWidget {
  const DiagnosisKid133Page({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
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
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "카메라 및 음성 권한을 허용해주세요",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BMJUA',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Video(
                    number: 1, // 추후에 번호 수정
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosisKid141Page(
                              avrScore: '',
                            ),
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
