import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() onTap;
  final String text;
  final TextStyle style;
  const GradientButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.style, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            stops: [1, 0.2],
            end: Alignment(-1.0, 2.5),
            transform: GradientRotation(340),
            colors: [
              Color(0xFF212A41),
              Color(0xFF3DC0DF),
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Center(
            child: Text(
          text,
          style: style,
        )),
      ),
    );
  }
}
