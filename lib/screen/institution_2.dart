import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Untact extends StatefulWidget {
  const Untact({Key? key}) : super(key: key);

  @override
  UntactState createState() => UntactState();
}

class UntactState extends State<Untact> {
  var selectedProvince;
  var selectedCity;

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
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "토리찌가 도와줄게 !",
                        style: TextStyle(
                          fontFamily: 'BMJUA',
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "링크를 접속해서 프로그램을 예약할 수 있어요",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 35,
                    color: Color(0xFF96B9DB),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C1C5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      "아린이를 위한 온라인 플랫폼",
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "부모와 함께 언어 및 상담 교육 받기(유료)",
                  style: TextStyle(fontSize: 25, fontFamily: 'BMJUA'),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    const url = "http://laraclinic.kr/online-program";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                  child: const Text(
                    "http://laraclinic.kr/online-program",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BMJUA',
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "말하기, 듣기, 읽기, 쓰기 교육 받기(무료)",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'BMJUA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    const url =
                        "https://www.iksi.or.kr/lms/main/crseElrList.do";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                  child: const Text(
                    "https://www.iksi.or.kr/lms/main/crseElrList.do",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BMJUA',
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C1C5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      "부모님을 위한 온라인 플랫폼",
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "한국어 어휘부터 회화까지 교육 받기(무료)",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'BMJUA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    const url =
                        "https://www.iksi.or.kr/lms/main/crseMoreList_v2.do?cmtCrseSeCode=OFF001&crseType=OFF";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                  child: const Text(
                    "https://www.iksi.or.kr/lms/main/crseMoreList_v2.do?cmtCrseSeCode=OFF001&crseType=OFF",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BMJUA',
                      color: Colors.blue,
                    ),
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
