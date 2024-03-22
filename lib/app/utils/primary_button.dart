import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onTap;
  final Text child;
  final Color color;
  const PrimaryButton(
      {super.key,
      this.height,
      this.width,
      required this.child,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: child,
      ),
    );
  }
}