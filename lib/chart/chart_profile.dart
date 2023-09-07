import 'package:bridze/chart/chart_face.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bridze/chart/chart_language.dart';
import 'package:bridze/chart/chart_parent.dart';

//차트를 전체적으로 보여주는 페이지
class ProfileApp extends StatefulWidget {
  final String avrScore;
  final String crrScore;
  const ProfileApp({
    Key? key,
    required this.avrScore,
    required this.crrScore,
  }) : super(key: key);

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: const MyPageView(
        avrScore: '',
        crrScore: '',
      ),
    );
  }
}

//오른쪽으로 스크롤 가능하게 하는 코드
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyPageView extends StatefulWidget {
  final String avrScore;
  final String crrScore;
  const MyPageView({
    Key? key,
    required this.avrScore,
    required this.crrScore,
  }) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late String crrScore;
  String avrScore = '';
  String evaluation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ChartApp(), //언어평가 차트
          ChartApp2(), //부모평가 차트
          ChartFaceApp(), //정서평가 차트
        ],
      ),
    );
  }
}
