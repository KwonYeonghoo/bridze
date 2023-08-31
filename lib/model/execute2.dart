import 'package:http/http.dart' as http;

// 백엔드에서 비디오 프레임들의 이미지들을 cv 모델에 넣어 실행시키는 역할을 합니다.

Future<void> executeFile2() async {
  final url = Uri.parse('https://daitso.run.goorm.site/execute2');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}

// 백엔드에서 video_to_frame 함수를 실행 시키는 함수입니다.

Future<void> v2f() async {
  final url = Uri.parse('https://daitso.run.goorm.site/v2f');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}
