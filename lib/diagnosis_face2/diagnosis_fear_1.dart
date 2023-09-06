import 'package:bridze/diagnosis_face2/diagnosis_fear_2.dart';
import 'package:bridze/widgets/audio_fear.dart';
import 'package:flutter/material.dart';

class DiagnosisFear1Page extends StatefulWidget {
  const DiagnosisFear1Page({Key? key, required String avrScore})
      : super(key: key);

  @override
  State<DiagnosisFear1Page> createState() => _DiagnosisFear1PageState();
}

class _DiagnosisFear1PageState extends State<DiagnosisFear1Page> {
  AudioFear myAudioPlayer = AudioFear();

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer
            .toggleAudio(); // Start playing the audio when initialization is complete
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid_2.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/chat.png',
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  "đánh giá tình cảm",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Rowdies',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fear.png',
                ),
                const SizedBox(height: 30),
                const Text(
                  "안녕 ! 나는 두려운 표정이야 !",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'BMJUA',
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(0, 0, 40, 40), // Add spacing here
                child: GestureDetector(
                  onTap: () {
                    myAudioPlayer.dispose();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiagnosisFear2Page(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/cursor.png",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
