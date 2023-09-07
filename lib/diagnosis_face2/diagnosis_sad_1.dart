import 'package:bridze/diagnosis_face2/diagnosis_sad_2.dart';
import 'package:bridze/widgets/audio_sad.dart';
import 'package:flutter/material.dart';

//슬픈 표정을 알려줍니다.
class DiagnosisSad1Page extends StatefulWidget {
  const DiagnosisSad1Page({Key? key, required String avrScore})
      : super(key: key);

  @override
  State<DiagnosisSad1Page> createState() => _DiagnosisSad1PageState();
}

class _DiagnosisSad1PageState extends State<DiagnosisSad1Page> {
  //페이지로 넘어오면 오디오가 재생되는 코드입니다.
  AudioSad myAudioPlayer = AudioSad();

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer.toggleAudio();
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
                  'assets/images/sad.png',
                ),
                const SizedBox(height: 30),
                const Text(
                  "안녕 ! 나는 슬픈 표정이야 !",
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
                        builder: (context) => const DiagnosisSad2Page(),
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
