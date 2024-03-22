import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/utils/all_validator.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/my_textfield.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(
                    // menuItem: controller.popupMenuList,
                    ),
                SizedBox(height: 34.h),
                Center(
                  child: Text(
                    "Hire Teacher Top and Verified Teacher",
                    style: Styles.semibold7(20),
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 100 / 89,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 6,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.imageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3DC0DF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.81),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            controller.imageList[index].imagePath,
                            height: 50,
                          ),
                          Text(
                            controller.imageList[index].imageSubTitle,
                            style: Styles.bold8(
                              20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            controller.imageList[index].imageTitle,
                            style: Styles.regular4(
                              14,
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 40.h),
                Center(
                  child: Text(
                    "Teacher Login",
                    style: Styles.semibold7(25),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 35.h),
                textFiledTitle(name: "Email*"),
                MyTextField(
                  controller: controller.workEmailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: "Email",
                  validator: (p0) {
                    return AllTypeValidator.validateEmail(
                        p0, "Email is required");
                  },
                ),
                SizedBox(height: 15.h),
                textFiledTitle(name: "Password*"),
                Obx(() => MyTextField(
                      controller: controller.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: !controller.passwordShow,

                      hintText: "Password",
                      validator: (p0) {
                        return AllTypeValidator.validatePassword(
                            p0, "Password is required");
                      },
                      suffixIcon: IconButton(
                        onPressed: controller.passwordVisibility,
                        iconSize: 20,
                        // color: AppColors.hintTextColor,
                        icon: controller.passwordShow
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    )),
                // TextButton(
                //   onPressed: () {},
                //   isSemanticButton: false,
                //   style: TextButton.styleFrom(
                //       disabledForegroundColor: AppColors.blackColor,
                //       disabledBackgroundColor: AppColors.blackColor,
                //       foregroundColor: AppColors.whiteColor),
                //   child: Text("Forget Password?", style: Styles.medium6(14)),
                // ),
                SizedBox(height: 10.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.tecLogIn();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                    ),
                    child: Text(
                      "Login",
                      style: Styles.bold8(18, color: AppColors.whiteColor),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // loginButton(
                //   title: 'New to Teach-Lancer? | ',
                //   subTitle: 'Create an Account',
                //   onTap: () => Get.toNamed(Routes.TEA_REGISTER),
                // ),
                // SizedBox(height: 40),
                SizedBox(height: 8.h),
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180.w,
                    height: 30,
                  ),
                ),
                termPolicyButton(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
