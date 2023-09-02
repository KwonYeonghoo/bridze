import 'package:bridze/chart/chart_profile.dart';
import 'package:bridze/screen/institution.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({Key? key}) : super(key: key);

  @override
  State<Login2Page> createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  @override
  String avrScore = '';
  String crrScore = '';

  @override
  void initState() {
    super.initState();
    _loadAvrScore();
  }

  Future<void> _loadAvrScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      avrScore = prefs.getString('globalavrScore') ?? '';
    });
  }

  Future<void> _loadCrrScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      crrScore = prefs.getString('globalcrrScore') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "토리찌가 도와줄게 !",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "BMJUA",
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "세상을 잇는 BridZe",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "BMJUA",
                      color: Color(0xFFA1C0DD),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 400,
                              decoration: const BoxDecoration(
                                color: Color(0xFFA1C0DD),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/diary.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "진행했던\n평가 결과를\n보고싶다면 ?",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "BMJUA",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ProfileApp(
                                            crrScore: crrScore,
                                            avrScore: avrScore,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        width: 230,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.0)),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(),
                                            Text(
                                              "평가 결과 >",
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: "BMJUA",
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Container(
                                width: 300,
                                height: 400,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFA1C0DD),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/calendar.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "근처 기관\n방문 일정을\n잡고싶다면 ?",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "BMJUA",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle the action when tapped
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const InstitutionRecommend()), // Replace with the appropriate widget
                                            );
                                          },
                                          child: Container(
                                            width: 230,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "기관 추천 >",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: "BMJUA",
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
