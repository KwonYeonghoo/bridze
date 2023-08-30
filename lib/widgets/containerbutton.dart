import 'package:flutter/material.dart';

class ContainerButton extends StatefulWidget {
  const ContainerButton({
    super.key,
    required this.labelText,
    required this.subLabelText,
    required this.onPressed,
    required this.isParentButton,
  });

  final String labelText;
  final String subLabelText;
  final VoidCallback onPressed;
  final bool isParentButton;

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = widget.isParentButton
        ? const Color(0xFF96B9DB)
        : const Color(0xFFE5C1C5);

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: buttonColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.labelText,
                style: const TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.subLabelText,
                style: const TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
