// 주어진 감정 상황에 따라 특정 URL로 HTTP GET 요청을 보내 파일을 실행시키는 함수입니다.
// 백엔드에서 감정따라하기의 이미지들을 cv 모델에 넣어 실행시키는 역할을 합니다.

import 'package:http/http.dart' as http;

Future<void> executeFile(String emotion) async {
  final url =
      Uri.parse('https://daitso.run.goorm.site/execute?emotion=$emotion');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}
