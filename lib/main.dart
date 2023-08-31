import 'package:bridze/provider/face_evaluation.dart';
import 'package:bridze/provider/institution_recommended.dart';
import 'package:bridze/screen/diagnosis.dart';
import 'package:bridze/screen/home.dart';
import 'package:bridze/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      // MultiProvider로 여러 Provider 관리
      providers: [
        ChangeNotifierProvider(
            create: (context) => TotalScoreProvider()), // 기존 Provider
        ChangeNotifierProvider(create: (context) => AppData()), // 새로운 Provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/diagnosis': (context) => const DiagnosisScreen(),
        '/profile': (context) => const LoginPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Your background image
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/torizzi.png',
                  width: 143,
                  height: 130,
                ),
                const SizedBox(height: 20),
                const Text(
                  'BridZe',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BMJUA',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  '다문화가정 아동들을 세상으로 잇다',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'BMJUA',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildIconButton(
                        icon: Icons.home,
                        label: '홈',
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      const SizedBox(width: 120),
                      buildIconButton(
                        icon: Icons.favorite,
                        label: '평가',
                        onPressed: () {
                          Navigator.pushNamed(context, '/diagnosis');
                        },
                      ),
                      const SizedBox(width: 120),
                      buildIconButton(
                        icon: Icons.person,
                        label: '프로필',
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 50,
            color: Colors.black,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
