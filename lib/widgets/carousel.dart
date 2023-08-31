import 'package:bridze/screen/institution_2.dart';
import 'package:bridze/widgets/institution.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CityCarousel extends StatelessWidget {
  @override
  final List<Institution> cities;

  const CityCarousel({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enableInfiniteScroll: false,
      ),
      items: cities.map((city) {
        return buildCarouselItem(
          context,
          city.name,
          city.phoneNumber,
          city.imagePath,
          city.address,
        );
      }).toList(),
    );
  }

  Widget buildCarouselItem(BuildContext context, String title,
      String phoneNumber, String imagePath, String address) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Untact(), // Replace with your CalendarApp widget
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 300,
            height: 227,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMJUA',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '전화번호: $phoneNumber',
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'BMJUA',
            ),
          ),
          Text(
            '지번: $address',
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'BMJUA',
            ),
          )
        ],
      ),
    );
  }
}
