import 'package:bridze/screen/diagnosis_vietnam/diagnosis_kid_7.dart';
import 'package:flutter/material.dart';

class VietnamPage extends StatelessWidget {
  const VietnamPage({Key? key}) : super(key: key);

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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/torizzi.png',
                    height: 280,
                    width: 280,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    '베트남어 할 수 있어요?',
                    style: TextStyle(
                      fontFamily: 'BMJUA',
                      fontSize: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 250,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE5C1C5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DiagnosisKid7Page()));
                                      },
                                    ),
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '예\n베트남어 진단 받기',
                                      style: TextStyle(
                                        fontFamily: 'BMJUA',
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        const SizedBox(width: 180),
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 250,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE5C1C5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '아니요\n베트남어 진단 받지 않기',
                                      style: TextStyle(
                                        fontFamily: 'BMJUA',
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
