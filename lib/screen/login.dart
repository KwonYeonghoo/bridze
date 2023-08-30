import 'package:bridze/screen/calendart.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String enteredUsername = "";
  String enteredPassword = "";

  void handleLogin() {
    String validUsername = "daitso";
    String validPassword = "1234";

    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      // Successful login, navigate to the next screen or perform any other action
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalendarApp()),
      );
    } else {
      // Failed login, show an error message or perform any other action
      print("Login failed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "로그인",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "BMJUA",
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "세상을 잇는 BridZe",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "BMJUA",
                      color: Color(0xFFA1C0DD),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    // Use TextFormField or TextField here for the username input
                    onChanged: (value) {
                      setState(() {
                        enteredUsername = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "아이디",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        enteredPassword = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "비밀번호",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: handleLogin,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFA1C0DD),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: const Center(
                        child: Text(
                          "로그인",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "BMJUA",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
