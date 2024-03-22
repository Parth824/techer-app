import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/my_textfield.dart';
import 'package:tech_lancer_teacher/app/utils/navbar.dart';

import '../../../../utils/all_validator.dart';
import '../controllers/tea_dashboard_controller.dart';

class TeaDashboardView extends GetView<TeaDashboardController> {
  const TeaDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // controller.getCourse();
    // Future<bool> call() async {
    //   return true;

    // }

    // call().then((value) async {
    //   if (controller.coursesResponse.data == null) {
    //     await controller.getCourse();
    //   }
    // });
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Intercept back button press
        bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return exit; // Return true to exit if 'exit' is true, otherwise return false
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {
              await controller.getCourse();
            },
            child: Obx(() => ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyAppBar(),
                    SizedBox(
                      height: 20.h,
                    ),
                    DashboardCard(
                      visibal: false,
                      count: controller.coursesResponse.data?.first.title ??
                          "Course Not assing",
                      name:
                          controller.coursesResponse.data?.first.description ??
                              "Course Not assing",
                      // iconData: Icons.work_outline,
                    ),
                    SizedBox(height: 20.h),
                    DashboardCard(
                      visibal: true,
                      count:
                          controller.enrolledResponse.data?.length.toString() ??
                              "0",
                      name: "ENROLL USER",
                      iconData: LineIcons.user,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Lecture time",
                      style: Styles.bold8(
                        24,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DashboardCard1(
                      count: controller.lectureResponse.data?.first.slot
                              .toString() ??
                          "0",
                      time:
                          "${controller.lectureResponse.data?.first.startTime ?? "00:00"} to ${controller.lectureResponse.data?.first.endTime ?? "00:00"}",
                      iconData: Icons.arrow_outward_outlined,
                      onTap: () {
                        Get.offAllNamed(Routes.TEA_USER);
                      },
                    ),
                  ],
                )),
          ),
        ),
        drawer: const NavigationDrawerWidget(),
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('StartLecture Link'),
                content: Container(
                  height: 100.h,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFiledTitle(name: "Link*"),
                        TextFormField(
                          controller: controller.textEditingController,
                          // keyboardType: textInputType,
                          cursorHeight: 22,
                          // maxLines: maxLines,
                          // onChanged: onChanged,
                          // obscureText: obscureText ?? false,
                          style: Styles.regular4(15,
                              color: AppColors.primaryColor),
                          decoration: InputDecoration(
                            hintText: "Enter Link",
                            hintStyle: Styles.regular4(15,
                                color: AppColors.hintTextColor),
                            constraints: BoxConstraints.loose(Size.infinite),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            // suffixIcon: suffixIcon,
                            filled: true,
                            fillColor: const Color(0xFFDADADA),
                          ),
                          validator: (p0) {
                            return AllTypeValidator.validateString(
                                p0, "Link is required");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.tecStartLect();
                    },
                    child: const Text('Send'),
                  ),
                ],
              ),
            );
          },
          child: Container(
              height: 60.h,
              width: 60.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
              child: const Icon(
                Icons.add,
                color: AppColors.whiteColor,
              )),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {super.key, this.count, this.name, this.iconData, required this.visibal});

  final String? count;
  final String? name;
  final IconData? iconData;
  final bool visibal;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: AppColors.blackColor.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(0, 5)),
        ],
        border: Border.all(color: AppColors.secondaryColor, width: 1),
      ),
      child: Column(
        children: [
          Container(
            height: 8.h,
            color: AppColors.secondaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$count",
                        style: Styles.bold8(
                          22,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        name!,
                        style: Styles.regular4(
                          15,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: visibal,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.jobColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(
                      iconData,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard1 extends StatelessWidget {
  const DashboardCard1({
    super.key,
    this.count,
    this.time,
    this.iconData,
    this.onTap,
  });

  final String? count;
  final String? time;
  final IconData? iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: AppColors.blackColor.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(0, 5)),
        ],
        border: Border.all(color: AppColors.secondaryColor, width: 1),
      ),
      child: Column(
        children: [
          Container(
            height: 8.h,
            color: AppColors.secondaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$time",
                      style: Styles.regular4(
                        18,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          "Total Seat: ",
                          style: Styles.bold8(
                            15,
                          ),
                        ),
                        Text(
                          "$count",
                          style: Styles.regular4(
                            15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      iconData,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
