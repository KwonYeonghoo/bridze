import 'package:bridze/diagnosis_face2/diagnosis_angry_1.dart';
import 'package:bridze/model/execute2.dart';
import 'package:flutter/material.dart';
import '../../model/picture.dart';
import '../model/execute.dart';

class DiagnosisHappy3Page extends StatelessWidget {
  const DiagnosisHappy3Page({Key? key}) : super(key: key);

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
                  child: picture(),
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
                            builder: (context) => const DiagnosisAngry1Page(
                              avrScore: '',
                            ),
                          ),
                        );
                        executeFile('happy');
                        v2f();
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
