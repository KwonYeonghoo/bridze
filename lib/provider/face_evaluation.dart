import 'package:flutter/foundation.dart';

class TotalScoreProvider with ChangeNotifier {
  final List<int> _scores = [];
  final List<int> _relationshipScores = [];

  List<int> get scores => _scores;

  void addScore(int score) {
    _scores.add(score);
    notifyListeners();
  }

  void addRelationshipScore(int score) {
    _relationshipScores.add(score);
    notifyListeners();
  }

  double get averageScore {
    if (_scores.isEmpty) return 0;
    int total = _scores.reduce((value, element) => value + element);
    return total / _scores.length;
  }

  double get relationshipScore {
    if (_relationshipScores.isEmpty) return 0;
    int total = _relationshipScores.reduce((value, element) => value + element);
    double scaledTotal = total * 2; // Convert to double without scaling
    return scaledTotal > 100 ? 100 : scaledTotal; // Cap the score at 100
  }
}

