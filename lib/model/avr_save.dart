import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Score extends StatefulWidget {
  final String initialValue;
  final int number;

  // 생성자로 받아온 초기값에 따라 crr로 비교할 글이 달라짐.
  const Score({Key? key, required this.initialValue, required this.number})
      : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  late String value;
  late String url; // API 요청을 보낼 주소
  String crrScore = '';
  String avrScore = ''; // crr 점수를 저장할 변수 (string형, 필요시 double형으로 수정)
  late int number;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue; // 초기값을 변수에 저장
    number = widget.number;
    url =
        'https://daitso.run.goorm.site/crr/$number?query=$value'; // API 요청 주소 설정
  }

  // API 요청을 보내고 결과를 처리하는 함수, 이 함수가 실행되면 현 위젯의 crrScore 값이 갱신된다.
  void fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url)); // 주어진 주소로 GET 요청
    if (response.statusCode == 200) {
      // 요청이 성공한 경우
      setState(() {
        crrScore = response.body; // 받아온 결과를 변수에 저장하여 UI 갱신
      });
    } else {
      // 요청이 실패한 경우
      setState(() {
        crrScore = 'Error: ${response.statusCode}'; // 에러 메시지를 변수에 저장하여 UI 갱신
      });
    }
  }

  void fetchavg() async {
    http.Response response = await http.get(Uri.parse(
        'https://daitso.run.goorm.site/crr/average')); // 주어진 주소로 GET 요청
    if (response.statusCode == 200) {
      // 요청이 성공한 경우
      setState(() {
        avrScore = response.body; // 받아온 결과를 변수에 저장하여 UI 갱신
      });
    } else {
      // 요청이 실패한 경우
      setState(() {
        avrScore = 'Error: ${response.statusCode}'; // 에러 메시지를 변수에 저장하여 UI 갱신
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
            fetchavg();
          },
          child: const Text(
            '문장 읽기를 마친 후 클릭해주세요!', // 버튼에 표시될 텍스트
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'BMJUA',
            ),
          ),
        ),
      ],
    );
  }
}
