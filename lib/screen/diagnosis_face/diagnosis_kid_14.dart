import 'package:flutter/material.dart';
import '../../widgets/video_recorder.dart';
import 'diagnosis_kid_13.dart';

class DiagnosisKid14Page extends StatelessWidget {
  const DiagnosisKid14Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid.png',
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
                  child: CameraExampleHome(),
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
                            builder: (context) => const DiagnosisKid13Page(),
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
