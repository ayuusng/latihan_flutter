import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;

  const TextContainer({
    required this.text,
    required this.color,
    this.width = 100,
    this.height = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
