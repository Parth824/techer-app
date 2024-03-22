import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/colors.dart';
import '../core/theme/styles.dart';

class CustomDropdownButtonField extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String Function(String?) itemToString;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;

  const CustomDropdownButtonField({
    super.key,
    required this.items,
    this.value,
    required this.itemToString,
    required this.onChanged,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                itemToString(item),
                style: Styles.regular4(15, color: AppColors.blackColor),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Styles.regular4(15, color: AppColors.blackColor),
      iconDisabledColor: const Color(0xFFDADADA),
      iconEnabledColor: const Color(0xFFDADADA),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.regular4(15, color: AppColors.hintTextColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.only(left: 20.w),
        filled: true,
        fillColor: const Color(0xFFDADADA),
      ),
      validator: validator,
    );
  }
}
