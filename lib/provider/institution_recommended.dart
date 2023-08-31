import 'package:flutter/foundation.dart';

class AppData with ChangeNotifier {
  String evaluation = '';
  String recommendation = '';

  void setEvaluation(String newEvaluation) {
    evaluation = newEvaluation;
    determineRecommendation();
    print(
        "Evaluation: $evaluation, Recommendation: $recommendation"); // 디버깅용 출력
    notifyListeners();
  }

  void determineRecommendation() {
    if (evaluation == '상') {
      recommendation = '비대면 프로그램을 추천합니다.';
    } else {
      recommendation = '정서 기관을 추천합니다.';
    }
  }
}
