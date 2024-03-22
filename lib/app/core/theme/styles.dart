import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';

class Styles {
  // // heavy

  // regular
  static TextStyle regular4(double size,
      {Color? color,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
        fontFamily: "Lato",
        color: color ?? AppColors.blackColor,
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontSize: size,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacing);
  }


  // medium
  static TextStyle medium6(double size,
      {Color? color,
      FontStyle? fontStyle,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Lato",
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle semibold7(double size,
      {Color? color,
      FontStyle? fontStyle,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Lato",
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      fontSize: size.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: letterSpacing,
    );
  }

  // bold
  static TextStyle bold8(double size,
      {Color? color,
      FontStyle? fontStyle,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Lato",
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      fontSize: size.sp,
      fontWeight: FontWeight.w800,
      letterSpacing: letterSpacing,
    );
  }
  // extrabold
  static TextStyle extrabold9(double size,
      {Color? color,
      FontStyle? fontStyle,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
      fontFamily: "Lato",
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      fontSize: size.sp,
      fontWeight: FontWeight.w900,
      letterSpacing: letterSpacing,
    );
  }
  //heavy
  static TextStyle heavy(double size,
      {Color? color,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      double? letterSpacing}) {
    return TextStyle(
        fontFamily: "Lato",
        color: color ?? AppColors.blackColor,
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontSize: size,
        fontWeight: FontWeight.bold,
        letterSpacing: letterSpacing);
  }
}
