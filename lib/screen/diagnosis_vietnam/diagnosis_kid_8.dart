import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import '../../widgets/audio_test.dart';

class DiagnosisKid8Page extends StatefulWidget {
  const DiagnosisKid8Page({Key? key}) : super(key: key);

  @override
  State<DiagnosisKid8Page> createState() => _DiagnosisKid8PageState();
}

class _DiagnosisKid8PageState extends State<DiagnosisKid8Page> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset(
          'assets/images/diagnosis_kid.png',
          fit: BoxFit.cover,
          width: 1440,
          height: 1024,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/book.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "따라해볼까요?",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'BMJUA',
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, top: 30),
              child: Text(
                textAlign: TextAlign.center,
                "Xin chào! Tôi thích hoa!",
                style: TextStyle(
                  fontSize: 100,
                  fontFamily: 'Sriracha',
                  color: Color(0xff000000),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 80),
              child: Center(
                child: AudioRecorderWidget(key: Key('audio_recorder8')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/kid.png',
                      width: 100,
                      height: 100,
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
                          builder: (context) => const DiagnosisScreen(),
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
      ]),
    );
  }
}
