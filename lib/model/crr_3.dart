// Score4 위젯은 초기값과 번호를 이용하여 API 요청을 보내고 결과를 처리하며, UI를 업데이트합니다.
// fetchdata 함수는 API 요청을 처리하고 결과를 화면에 반영하며 저장합니다.
// fetchavg 함수는 평균 결과를 가져오는 API 요청을 처리합니다.

import 'package:bridze/chart/chart_language_11.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Score4 extends StatefulWidget {
  final String initialValue;
  final int number;

  // 생성자로 받아온 초기값에 따라 crr로 비교할 글이 정해집니다.
  const Score4({Key? key, required this.initialValue, required this.number})
      : super(key: key);

  @override
  Score4State createState() => Score4State();
}

class Score4State extends State<Score4> {
  late String value;
  late String url; // API 요청을 보낼 주소
  String crrScore = '';
  late int number;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue; // 초기값을 변수에 저장
    number = widget.number;
    url =
        'https://daitso.run.goorm.site/crr/$number?query=$value'; // API 요청 주소 설정
  }

  // API 요청을 보내고 결과를 처리하는 함수, 이 함수가 실행되면 현 위젯의 crrScore 값이 갱신됩니다.
  void fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        crrScore = response.body;
      });

      // SharedPreferences에 avrScore을 저장합니다.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('globalcrrScore', crrScore);

      // Navigate to LanguagePage2 with the fetched crrScore
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LanguagePage4(
            crrScore: crrScore,
          ),
        ),
      );
    } else {
      setState(() {
        crrScore = 'Error: ${response.statusCode}';
      });
    }
  }

  // API 요청을 보내고 평균 결과를 처리하는 함수
  void fetchavg() async {
    http.Response response =
        await http.get(Uri.parse('https://daitso.run.goorm.site/crr/average'));
    if (response.statusCode == 200) {
      setState(() {
        crrScore = response.body;
      });

      // SharedPreferences에 avrScore을 저장합니다.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('globalcrrScore', crrScore);
    } else {
      setState(() {
        crrScore = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            fetchdata(url); // 버튼 클릭 시 fetchdata 함수 실행
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 133, 145),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '결과보기!',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
