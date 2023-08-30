import 'package:bridze/widgets/dropdownbutton.dart';
import 'package:flutter/material.dart';

class DiagnosisKidPage extends StatefulWidget {
  const DiagnosisKidPage({Key? key}) : super(key: key);

  @override
  State<DiagnosisKidPage> createState() => _DiagnosisKidPageState();
}

class _DiagnosisKidPageState extends State<DiagnosisKidPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                      "Bước 1",
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
                  "아이의 기본 정보를 입력해주세요!",
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
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: <Widget>[
                        Text(
                          '나이 :',
                          style: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(width: 30),
                        DropDown(),
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
