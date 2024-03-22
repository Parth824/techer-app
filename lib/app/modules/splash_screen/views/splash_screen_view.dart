import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';

import '../../../../main.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    // isRepeatingAnimation: true,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText("Welcome to",
                          textStyle: Styles.medium6(30),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Image.asset(
                    "assets/images/logo.png",
                    width: width / 1.2,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/Bg.png",
          ),
        ],
      ),
    );
  }
}
