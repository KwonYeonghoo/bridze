import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.imageAsset,
    required this.label,
    required this.onPressed,
  });

  final String imageAsset;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            width: 250,
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'BMJUA',
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
