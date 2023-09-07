// 로그인 페이지입니다

import 'package:bridze/widgets/dropdownbutton.dart';
import 'package:flutter/material.dart';

class DiagnosisKidPage extends StatefulWidget {
  const DiagnosisKidPage({Key? key}) : super(key: key);

  @override
  State<DiagnosisKidPage> createState() => _DiagnosisKidPageState();
}

class _DiagnosisKidPageState extends State<DiagnosisKidPage> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/glasses.png',
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Nhập thông tin",
                      style: TextStyle(
                        fontFamily: 'Rowdies',
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "아이의 기본 정보를 입력해주세요 !",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  'assets/images/torizzi.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          '이름 :',
                          style: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: TextFormField(
                            controller: nameController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          '나이 :',
                          style: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(width: 30),
                        DropDown(name: nameController.text)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
