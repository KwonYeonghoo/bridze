import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const CenterApp());
}

class CenterApp extends StatelessWidget {
  const CenterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0xEE, 0xf3, 0xf6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 150, top: 50),
            child: Text(
              "기관 선택 및 예약 확정을 진행해주세요",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'BMJUA',
                color: Color(0xff000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    _buildLeftBox(),
                    _buildLeftBox(),
                    _buildLeftBox(),
                  ],
                ),
                _buildRightBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftBox() {
    return Column(
      children: [
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: const Color.fromARGB(255, 0x96, 0xB9, 0xDB),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 260,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 260,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '031) 123-4567',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _buildRightBox() {
    return Container(
      alignment: Alignment.centerLeft,
      width: 375,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: const Color.fromARGB(255, 0xe5, 0xc1, 0xc5),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 25, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '이름',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
              ),
            ),
            Text(
              '부모님 이름',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 333,
              width: 375,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      37.4219999, -122.0840575), // Set initial map position
                  zoom: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              '기관명',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
              ),
            ),
            Text(
              '0000.00.00',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

mixin Marker {}
