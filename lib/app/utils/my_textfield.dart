import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';

class MyTextField extends StatelessWidget {
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final IconButton? suffixIcon;
  final bool? obscureText;

  const MyTextField({
    super.key,
    this.maxLines,
    required this.hintText,
    required this.controller,
    this.validator,
    this.textInputType,
    this.onChanged,
    this.suffixIcon,
     this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorHeight: 22,
      // maxLines: maxLines,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      style: Styles.regular4(15, color: AppColors.blackColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.regular4(15, color: AppColors.hintTextColor),
        constraints: BoxConstraints.loose(Size.infinite),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.only(
          left: 20.w,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFDADADA),
      ),
      validator: validator,
    );
  }
}

Padding textFiledTitle({required String name}) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w),
    child: Text(
      name,
      style: Styles.semibold7(18),
    ),
  );
}

Widget termPolicyButton() {
  return Center(
    child: Text.rich(
      TextSpan(
        text: 'Term of Use | ',
        children: <InlineSpan>[
          TextSpan(
            text: 'Privacy Policy ',
            style: Styles.regular4(12),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
        style: Styles.regular4(12),
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    ),
  );
}

Widget loginButton(
    {required String title,
    required String subTitle,
    required Function()? onTap}) {
  return Center(
    child: Text.rich(
      TextSpan(
        text: title,
        children: <InlineSpan>[
          TextSpan(
            text: subTitle,
            style: Styles.medium6(14),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
        style: Styles.medium6(14),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    ),
  );
}
