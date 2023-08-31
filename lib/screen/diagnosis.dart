import 'package:bridze/screen/diagnosis_face/diagnosis_kid_11.dart';
import 'package:bridze/screen/diagnosis_kid.dart';
import 'package:bridze/screen/diagnosis_mother/diagnosis_mother_1.dart';
import 'package:bridze/screen/login2.dart';
import 'package:bridze/widgets/containerbutton.dart';
import 'package:bridze/widgets/imagebutton.dart';
import 'package:flutter/material.dart';

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login2Page(),
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
        children: <Widget>[
          Image.asset(
            'assets/images/desktop2.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
            ),
            child: Column(
              children: <Widget>[
                const Text(
                  'BridZe와 함께 시작해볼까요 ?',
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: ImageButton(
                            imageAsset: 'assets/images/kid.png',
                            label: '아이진단용',
                            onPressed: () {
                              Navigator.pushNamed(context, '/diagnosis_mother');
                            }),
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: ContainerButton(
                              labelText: '언어평가 >',
                              subLabelText: 'đánh giá ngôn ngữ',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DiagnosisKidPage(),
                                  ),
                                );
                              },
                              isParentButton: false),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: ContainerButton(
                              labelText: '정서평가 >',
                              subLabelText: 'đánh giá tình cảm',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DiagnosisKid11Page(),
                                  ),
                                );
                              },
                              isParentButton: false),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ImageButton(
                          imageAsset: ('assets/images/mother.png'),
                          label: '부모진단용',
                          onPressed: () {
                            Navigator.pushNamed(context, '/diagnosis_mother');
                          }),
                    ),
                    const SizedBox(width: 40),
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        width: 300,
                        height: 200,
                        child: ContainerButton(
                            labelText: '언어평가 >',
                            subLabelText: 'đánh giá ngôn ngữ',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DiagnosisMother1Page()),
                              );
                            },
                            isParentButton: true),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Flexible(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/info.png',
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
