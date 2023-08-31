import 'package:bridze/face_save/picture_save.dart';
import 'package:bridze/provider/face_evaluation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ChartFaceApp());
}

class ChartFaceApp extends StatefulWidget {
  const ChartFaceApp({super.key});

  @override
  State<ChartFaceApp> createState() => ChartFaceAppState();
}

class ChartFaceAppState extends State<ChartFaceApp> {
  double getRelationshipScoreFromProvider() {
    return context.watch<TotalScoreProvider>().relationshipScore;
  }

  @override
  Widget build(BuildContext context) {
    final relationshipScore = getRelationshipScoreFromProvider();

    return MaterialApp(
      home: FacePage(
        relationshipScore: relationshipScore,
      ),
    );
  }
}

class FacePage extends StatefulWidget {
  final double relationshipScore;

  const FacePage({Key? key, required this.relationshipScore}) : super(key: key);

  @override
  _FacePageState createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  double relationshipScore = 0.0; // Initialize the relationshipScore
  String evaluation2 = '';

  String serverUrl = 'https://daitso.run.goorm.site/download/chart/image';
  Image? image;

  Future<void> _fetchImage() async {
    try {
      final response = await http.get(Uri.parse(serverUrl));
      if (response.statusCode == 200) {
        setState(() {
          image = Image.memory(response.bodyBytes, fit: BoxFit.cover);
        });
      } else {
        print('Failed to fetch image from server');
      }
    } catch (e) {
      print('Error fetching image from server: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Provider를 통해 관계 점수를 가져옵니다.
    relationshipScore = context.read<TotalScoreProvider>().relationshipScore;
    calculateEvaluation2(context.read<TotalScoreProvider>());

    data = [
      _ChartData(
        '또래친구점수',
        50,
        const Color.fromRGBO(254, 202, 202, 1.0),
      ),
      _ChartData(
        '부모와의 유대관계 점수', // 새로운 데이터 포인트 추가
        relationshipScore, // 관계 점수 사용
        const Color.fromARGB(255, 241, 133, 145),
      ),
    ];
    _tooltip = TooltipBehavior(enable: true);

    _fetchImage();
  }

  Future<void> calculateEvaluation2(TotalScoreProvider provider) async {
    double relationshipScore = provider.relationshipScore;

    if (relationshipScore >= 75) {
      setState(() {
        evaluation2 = '상';
      });
    } else if (relationshipScore >= 50) {
      setState(() {
        evaluation2 = '중상';
      });
    } else if (relationshipScore >= 25) {
      setState(() {
        evaluation2 = '중하';
      });
    } else {
      setState(() {
        evaluation2 = '하';
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('evaluation2', evaluation2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/desktop1_2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              const SizedBox(height: 70),
              const Center(
                child: Column(
                  children: [
                    Text(
                      '정서평가 결과',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '* 상/중상/중하/하로 평가',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 600,
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          labelStyle: const TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 100,
                          interval: 10,
                          labelStyle: const TextStyle(
                            fontFamily: 'BMJUA',
                            color: Colors.black,
                          ),
                        ),
                        tooltipBehavior: _tooltip,
                        series: <ChartSeries<_ChartData, String>>[
                          BarSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            name: '정서 평가',
                            pointColorMapper: (_ChartData data, _) =>
                                data.color,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true, // 데이터 레이블 활성화
                              textStyle: TextStyle(
                                fontFamily: 'BMJUA',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: image,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text(
                    '부모와의 유대관계 평가',
                    style: TextStyle(
                      fontFamily: 'BMJUA',
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PictureSave(),
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromRGBO(229, 193, 197, 1.0),
                      ),
                      child: Center(
                        child: Text(
                          '유대관계 평가 : $evaluation2',
                          style: const TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  final Color color;

  _ChartData(this.x, this.y, this.color);
}
