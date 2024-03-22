import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../core/theme/colors.dart';
import '../core/theme/styles.dart';

void mySnackbar({required String? msg, required String msgIcon}) {
  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SvgPicture.asset(
              msgIcon == "success" ? AssetsPath.success : AssetsPath.failure,
              package: 'awesome_snackbar_content',
              height: 30,
              // width: 10,
            ),
            SizedBox(width: 10),
            Text(msg ?? "Something Went Wrong",
                style: Styles.medium6(16, color: AppColors.whiteColor))
          ],
        ),
        backgroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        dismissDirection: DismissDirection.horizontal,
        hitTestBehavior: HitTestBehavior.translucent,
      ),
    );
}

void myLoader() {
  Get.dialog(Center(
    child: CupertinoActivityIndicator(
      color: AppColors.whiteColor,
    ),
  ));
}
