// 이 코드에서는 비디오 녹화와 관련된 작업을 수행합니다.

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'upload.dart';

class Video extends StatefulWidget {
  final int number;

  // Video 위젯 생성자
  const Video({super.key, required this.number});

  @override
  State<Video> createState() {
    return _VideoState();
  }
}

// 카메라 오류 로그 출력 함수
void _logError(String code, String? message) {
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _VideoState extends State<Video>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? videoFile;
  bool enableAudio = true;
  int? number;
  List<CameraDescription> _cameras = <CameraDescription>[];

  @override
  void initState() {
    super.initState();
    number = widget.number;
    initStateAsync();
  }

  // 비동기로 initState 처리
  void initStateAsync() async {
    WidgetsBinding.instance.addObserver(this);
    initializeCamera();
  }

  // 카메라 초기화 함수
  void initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      _logError(e.code, e.description);
    }

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // 카메라 전환 버튼 처리
  void onCameraTogglePressed() {
    if (controller!.value.isRecordingVideo) {
      onStopButtonPressed();
    }
    if (videoFile != null) {
      videoupload(videoFile, number!);
    }
    controller!.dispose();
    setState(() {
      controller = null;
      videoFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: controller!.value.isRecordingVideo
                  ? Colors.redAccent
                  : Colors.grey,
              width: 3.0,
            ),
          ),
          width: 700,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: CameraPreview(controller!),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _captureControlRowWidget(),
      ],
    );
  }

  // 촬영 버튼 레이아웃
  Widget _captureControlRowWidget() {
    final CameraController cameraController = controller!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.videocam),
          color: Colors.blue,
          onPressed: cameraController.value.isInitialized &&
                  !cameraController.value.isRecordingVideo
              ? onVideoRecordButtonPressed
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          color: Colors.red,
          onPressed: cameraController.value.isInitialized &&
                  cameraController.value.isRecordingVideo
              ? () {
                  onStopButtonPressed();
                }
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.no_photography_outlined),
          color: Colors.black,
          onPressed: cameraController.value.isInitialized
              ? onCameraTogglePressed
              : null,
        ),
      ],
    );
  }

  // 타임스탬프 생성 함수
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  // 스낵바 메시지 출력 함수
  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // 새로운 카메라 선택
  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      return controller?.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  // 카메라 컨트롤러 초기화 함수
  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          showInSnackBar('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
          showInSnackBar('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          showInSnackBar('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
          showInSnackBar('Audio access is restricted.');
          break;
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  // 오디오 모드 변경 처리
  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    onNewCameraSelected(controller!.description);
  }

  // 비디오 녹화 시작 처리
  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  // 비디오 녹화 중지 처리
  void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) {
      if (mounted) {
        setState(() {});
      }
      if (file != null) {
        showInSnackBar('Video recorded to ${file.path}');
        videoFile = file;
      }
    });
  }

  // 비디오 녹화 시작 함수
  Future<void> startVideoRecording() async {
    final CameraController cameraController = controller!;

    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  // 비디오 녹화 중지 함수
  Future<XFile?> stopVideoRecording() async {
    final CameraController cameraController = controller!;

    if (!cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  // 카메라 예외 메시지 출력 함수
  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
