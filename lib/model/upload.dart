// 이 코드는 이미지와 비디오 업로드 함수를 정의한 것으로, 각 함수는 주어진 파일을 서버에 업로드합니다.
// imageupload 함수는 주어진 이미지 파일을 서버로 업로드하고, videoupload 함수는 비디오 파일을 업로드합니다.
// 각 함수는 HTTP GET 요청을 통해 파일 데이터를 가져와 Multipart 형식의 POST 요청으로 서버에 보내며, 업로드 결과를 출력합니다.
// HTTP 오류가 발생할 경우 해당 상태 코드를 출력합니다.

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 이미지 업로드 함수
Future<void> imageupload(imageFile, int num) async {
  // 이미지 파일을 읽어서 HTTP GET 요청을 보냄
  http.Response aresponse = await http.get(
    Uri.parse(imageFile!.path),
  );

  if (aresponse.statusCode == 200) {
    // POST 요청을 위한 준비 단계
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://daitso.run.goorm.site/image/$num"),
    );

    // 이미지 데이터를 MultipartFile로 변환
    var audio = http.MultipartFile.fromBytes(
      'image',
      aresponse.bodyBytes,
      filename: 'image$num.jpg',
    );

    // 요청에 이미지 파일 추가
    request.files.add(audio);

    // 요청을 보내고 응답을 받음
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = utf8.decode(responseData);

    // 응답 결과 출력
    print(result);
  } else {
    // HTTP 오류 처리
    print('HTTP Error: ${aresponse.statusCode}');
  }
}

// 비디오 업로드 함수
Future<void> videoupload(videoFile, int num) async {
  // 비디오 파일을 읽어와서 HTTP GET 요청을 보냄
  http.Response aresponse = await http.get(
    Uri.parse(videoFile!.path),
  );
  String server = "https://daitso.run.goorm.site/video/$num";
  if (aresponse.statusCode == 200) {
    // POST 요청을 위한 준비 단계
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(server),
    );

    // 비디오 데이터를 MultipartFile로 변환
    var video = http.MultipartFile.fromBytes(
      'video',
      aresponse.bodyBytes,
      filename: 'video$num.mp4',
    );

    // 요청에 비디오 파일 추가
    request.files.add(video);

    // 요청을 보내고 응답을 받음
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = utf8.decode(responseData);

    // 응답 결과 출력
    print(result);
  } else {
    // HTTP 오류 처리
    print('HTTP Error: ${aresponse.statusCode}');
  }
}
