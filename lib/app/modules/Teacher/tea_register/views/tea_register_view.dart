import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';
import 'package:tech_lancer_teacher/app/utils/all_validator.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/my_textfield.dart';

import '../controllers/tea_register_controller.dart';

class TeaRegisterView extends GetView<TeaRegisterController> {
  const TeaRegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(),
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  "Create New Account",
                  style: Styles.extrabold9(24),
                ),
              ),
              SizedBox(height: 26.h),
              textFiledTitle(name: "Your First Name*"),
              MyTextField(
                controller: controller.firstNameController,
                textInputType: TextInputType.emailAddress,
                hintText: "Your Name",
                validator: (p0) {
                  return AllTypeValidator.validateString(
                      p0, "Name is required");
                },
              ),
              SizedBox(height: 26.h),
              textFiledTitle(name: "Your Last Name*"),
              MyTextField(
                controller: controller.lastNameController,
                textInputType: TextInputType.emailAddress,
                hintText: "Your Name",
                validator: (p0) {
                  return AllTypeValidator.validateString(
                      p0, "Name is required");
                },
              ),
              SizedBox(height: 15.h),
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
              textFiledTitle(name: "Mobile Number*"),
              MyTextField(
                controller: controller.mobileController,
                textInputType: TextInputType.number,
                hintText: "Mobile Number",
                validator: (p0) {
                  return AllTypeValidator.validateMobile(
                      p0, "Mobile Number is required");
                },
              ),
              SizedBox(height: 15.h),
              textFiledTitle(name: "Experience*"),
              MyTextField(
                controller: controller.experienceController,
                textInputType: TextInputType.emailAddress,
                hintText: "Experience",
                validator: (p0) {
                  return AllTypeValidator.validateString(
                      p0, "Experience is required");
                },
              ),
              SizedBox(height: 15.h),
              textFiledTitle(name: "Bio*"),
              MyTextField(
                controller: controller.BioController,
                textInputType: TextInputType.emailAddress,
                hintText: "Bio",
                validator: (p0) {
                  return AllTypeValidator.validateString(
                      p0, "Bio is required");
                },
              ),
              SizedBox(height: 15.h),
              textFiledTitle(name: "Position*"),
              MyTextField(
                controller: controller.experienceController,
                textInputType: TextInputType.emailAddress,
                hintText: "Position",
                validator: (p0) {
                  return AllTypeValidator.validateString(
                      p0, "Position is required");
                },
              ),
              SizedBox(height: 15.h),
              textFiledTitle(name: "Password*"),
              MyTextField(
                controller: controller.passwordController,
                textInputType: TextInputType.emailAddress,
                hintText: "Password",
                validator: (p0) {
                  return AllTypeValidator.validatePassword(
                      p0, "Password is required");
                },
              ),
              SizedBox(height: 15.h),
              textFiledTitle(name: "Confirm Password*"),
              MyTextField(
                controller: controller.confirmPasswordController,
                textInputType: TextInputType.emailAddress,
                hintText: "Confirm Password",
                validator: (p0) {
                  return AllTypeValidator.validateConfirmPassword(
                      p0, controller.passwordController.text,"Confirm Password is required");
                },
              ),
              SizedBox(height: 15.h),
              Center(
                child: ElevatedButton(
                  onPressed: controller.userRegistration,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                  ),
                  child: Text(
                    "Create New Account",
                    style: Styles.bold8(18, color: AppColors.whiteColor),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              loginButton(
                title: 'Have An Account? | ',
                subTitle: 'Login Now',
                onTap: () => Get.toNamed(Routes.LOG_IN),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
