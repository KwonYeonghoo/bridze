import 'package:flutter/foundation.dart';

class TotalScoreProvider with ChangeNotifier {
  final List<int> _scores = []; // 점수를 저장하는 리스트
  final List<int> _relationshipScores = []; // 관계 점수를 저장하는 리스트

  List<int> get scores => _scores; // 점수 리스트에 대한 getter

  // 점수를 추가하는 메서드
  void addScore(int score) {
    _scores.add(score); // 점수 리스트에 점수 추가
    notifyListeners(); // 변경 사항을 알림
  }

  // 관계 점수를 추가하는 메서드
  void addRelationshipScore(int score) {
    _relationshipScores.add(score); // 관계 점수 리스트에 점수 추가
    notifyListeners(); // 변경 사항을 알림
  }

  // 평균 점수를 계산하는 getter
  double get averageScore {
    if (_scores.isEmpty) return 0;
    int total = _scores.reduce((value, element) => value + element); // 점수 합계 계산
    return total / _scores.length; // 평균 계산
  }

  double get relationshipScore {
    if (_relationshipScores.isEmpty) return 0;
    int total = _relationshipScores
        .reduce((value, element) => value + element); //관계 점수 합계 계산
    double scaledTotal = total * 2; // 100점 만점으로 환산
    return scaledTotal > 100 ? 100 : scaledTotal; // 100점 초과 방지
  }
}
