import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp2 extends StatelessWidget {
  const ChartApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LanguagePage2(
        avrScore: '',
      ),
    );
  }
}

class LanguagePage2 extends StatefulWidget {
  final String avrScore;

  const LanguagePage2({Key? key, required this.avrScore}) : super(key: key);

  @override
  LanguagePage2State createState() => LanguagePage2State();
}

class LanguagePage2State extends State<LanguagePage2> {
  String avrScore = '';
  String evaluation = '';

  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    avrScore = widget.avrScore; // avrScore 값을 먼저 받아옴
    calculateEvaluation();
    _tooltip = TooltipBehavior(enable: true);
  }

  Future<void> initializeChartData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? score = prefs.getString('globalavrScore');
    double parsedScore = double.tryParse(score ?? '') ?? 0.0;

    data = [
      ChartData(
        '또래친구점수',
        75,
        const Color.fromRGBO(254, 202, 202, 1.0),
      ),
      ChartData(
        '아린이점수',
        parsedScore,
        const Color.fromARGB(255, 241, 133, 145),
      ),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  void calculateEvaluation() {
    double score = double.tryParse(avrScore) ?? 0.0;
    if (score >= 100) {
      evaluation = '상';
    } else if (score >= 88) {
      evaluation = '상';
    } else if (score > 69) {
      evaluation = '중';
    } else {
      evaluation = '하';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: initializeChartData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildChartAndUI();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildChartAndUI() {
    double score = double.tryParse(widget.avrScore) ?? 0.0;

    if (score >= 100) {
      evaluation = '상';
    } else if (score >= 88) {
      evaluation = '상';
    } else if (score > 69) {
      evaluation = '중';
    } else {
      evaluation = '하';
    }
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
                    '아린이의 언어평가 결과',
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
                    child: Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromRGBO(229, 193, 197, 1.0),
                      ),
                      child: Center(
                        child: Text(
                          '발음 평가 : $evaluation',
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
