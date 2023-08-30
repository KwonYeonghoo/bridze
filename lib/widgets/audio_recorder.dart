import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';

class audio_recorderWidget extends StatefulWidget {
  final void Function(String path) onStop;

  const audio_recorderWidget({Key? key, required this.onStop})
      : super(key: key);

  @override
  State<audio_recorderWidget> createState() => _audio_recorderWidgetState();
}

class _audio_recorderWidgetState extends State<audio_recorderWidget> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();
        _recordDuration = 0;
        _startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;
    final path = await _audioRecorder.stop();
    if (path != null) {
      widget.onStop(path);
    }
  }

  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildRecordStopControl(),
            const SizedBox(width: 10),
            //_buildPauseResumeControl(),
            //const SizedBox(width: 20),
            _buildText(),
          ],
        ),
      ],
    );
  }

  Widget _buildRecordStopControl() {
    late Widget image;
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = const Icon(Icons.stop, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
      color = Colors.transparent;
    } else {
      image = Image.asset(
        'assets/images/microphone.png',
        color: Colors.black,
        height: 30,
        width: 30,
      );
      color = Colors.transparent;
    }

    return Material(
      color: color,
      child: InkWell(
        child: (_recordState != RecordState.stop) ? icon : image,
        onTap: () {
          (_recordState != RecordState.stop) ? _stop() : _start();
        },
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (_recordState == RecordState.record) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState == RecordState.pause) ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "음성을 녹음 중입니다",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'BMJUA',
            ),
          ),
          const SizedBox(height: 5),
          _buildTimer(),
        ],
      );
    }

    return const Text(
      "마이크를 클릭하면 녹음이 시작됩니다",
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'BMJUA',
      ),
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
