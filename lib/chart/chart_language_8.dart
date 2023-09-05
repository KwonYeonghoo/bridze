import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp3 extends StatelessWidget {
  const ChartApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LanguagePage3(
        crrScore: '',
      ),
    );
  }
}

class LanguagePage3 extends StatefulWidget {
  final String crrScore;

  const LanguagePage3({
    Key? key,
    required this.crrScore,
  }) : super(key: key);

  @override
  LanguagePage3State createState() => LanguagePage3State();
}

class LanguagePage3State extends State<LanguagePage3> {
  String crrScore = '';
  String evaluation2 = '';

  late List<ChartData> data = [];
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    crrScore = widget.crrScore;
    _tooltip = TooltipBehavior(enable: true);
    initializeChartData();
  }

  Future<void> initializeChartData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? score3 = prefs.getString('globalcrrScore');
    double parsedScore3 = double.tryParse(score3 ?? '') ?? 0.0;

    setState(() {
      data = [
        ChartData(
          '또래친구 점수',
          90,
          const Color.fromRGBO(254, 202, 202, 1.0),
        ),
        ChartData(
          '아동 점수',
          parsedScore3,
          const Color.fromARGB(255, 241, 133, 145),
        ),
      ];

      calculateEvaluation();
    });
  }

  void calculateEvaluation() {
    double score3 = double.tryParse(crrScore) ?? 0.0;
    if (score3 >= 100) {
      evaluation2 = '상';
    } else if (score3 >= 91) {
      evaluation2 = '상';
    } else if (score3 > 73) {
      evaluation2 = '중';
    } else {
      evaluation2 = '하';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildChartAndUI(),
    );
  }

  Widget buildChartAndUI() {
    return Stack(
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
                    '언어평가 결과',
                    style: TextStyle(
                      fontFamily: 'BMJUA',
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '* 상중하로 평가',
                    style: TextStyle(
                      fontFamily: 'BMJUA',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
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
                  series: <ChartSeries<ChartData, String>>[
                    BarSeries<ChartData, String>(
                      dataSource: data,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: '언어 평가',
                      pointColorMapper: (ChartData data, _) => data.color,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
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
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  const Text(
                    '발음 및 읽기 능력 평가',
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
                          builder: (context) => const DiagnosisScreen(),
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
                          '발음 평가 : $evaluation2',
                          style: const TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}
