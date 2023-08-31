import 'package:bridze/main.dart';
import 'package:flutter/material.dart';

class DiagnosisHome2Page extends StatelessWidget {
  const DiagnosisHome2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_home.png',
            width: 1440,
            height: 1024,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 30,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "BridZe, 이렇게 평가해요 !",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                      color: Color(0xffED8F99),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 30,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "정확한 평가를 위해 꼭 모든 평가를 완료해줘 !",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'BMJUA',
                      color: Color(0xffED8F99),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Column(
                  children: [
                    Image.asset('assets/images/flowchart_kid.png', width: 980),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Column(
                  children: [
                    Image.asset('assets/images/flowchart_mother.png',
                        width: 350),
                    const SizedBox(width: 10),
                  ],
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
                            builder: (context) => const HomePage(),
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
