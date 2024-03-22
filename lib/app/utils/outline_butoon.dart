
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() onTap;
  final String text;
  final TextStyle style;
  const OutlineButton(
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
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Color(0xFF3DC0DF)),
            borderRadius: BorderRadius.circular(5),
          ),
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

