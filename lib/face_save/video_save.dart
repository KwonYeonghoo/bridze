// 이전에 '왜 그렇게 설명헀어?' 페이지에서 녹화한 영상을 다시 보여줍니다.
// 각 3개의 비디오를 재생하고 일시정지할 수 있으며, 하단의 네비게이션 바를 사용하여 원하는 비디오를 선택할 수 있습니다.

import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  // 비디오 플레이어 컨트롤러 리스트
  late List<VideoPlayerController> _controllers;
  // 현재 선택된 비디오 인덱스
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    // 비디오 플레이어 컨트롤러 초기화
    _controllers = _initializeVideoControllers();
    // 초기 선택 인덱스 설정
    _currentIndex = 0;
  }

  // 비디오 플레이어 컨트롤러 초기화 및 비디오 URL 설정
  List<VideoPlayerController> _initializeVideoControllers() {
    return [
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/1'),
      ),
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/2'),
      ),
      VideoPlayerController.networkUrl(
        Uri.parse('https://daitso.run.goorm.site/download/video/3'),
      ),
    ]..forEach((controller) async {
        await controller.initialize();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiagnosisScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/desktop1_2.png', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Column(
                    children: [
                      Text(
                        "토리찌 질문에 답한 영상 모음",
                        style: TextStyle(
                          fontFamily: "BMJUA",
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "부모님이 참고하시거나 기관에 보여줘도 돼요!",
                        style: TextStyle(
                          fontFamily: "BMJUA",
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 400,
                    width: 600,
                    child: Center(
                      child: _controllers.isNotEmpty &&
                              _controllers[_currentIndex].value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  _controllers[_currentIndex].value.aspectRatio,
                              child: VideoPlayer(_controllers[_currentIndex]),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      final controller = _controllers[_currentIndex];
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 241, 133, 145),
                  child: Icon(
                    _controllers[_currentIndex].value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  _controllers[_currentIndex].pause();
                  setState(() {
                    _currentIndex = index;
                  });
                },
                selectedItemColor: const Color.fromARGB(255, 241, 133, 145),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 1',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 2',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_label),
                    label: 'Video 3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
