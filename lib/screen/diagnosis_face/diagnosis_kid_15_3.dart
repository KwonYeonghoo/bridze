// 카메라에 아이의 얼굴이 비치는지 확인합니다
// 영상 화면 하단에 카메라 아이콘을 눌러 영상을 녹화후 파란색으로 변하면 녹화를 종료합니다
// 오른쪽 하단에 finish 버튼을 누르면 다음 페이지로 넘어갑니다

import 'package:bridze/screen/diagnosis_face/diagnosis_kid_16_1.dart';
import 'package:flutter/material.dart';
import '../../model/video.dart';

class DiagnosisKid153Page extends StatelessWidget {
  const DiagnosisKid153Page({Key? key}) : super(key: key);

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
                    number: 3, // 추후에 번호 수정
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
                            builder: (context) => const DiagnosisKid161Page(
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
