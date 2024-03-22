import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/utils/all_validator.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/my_textfield.dart';
import 'package:tech_lancer_teacher/app/utils/navbar.dart';
import '../controllers/tea_user_controller.dart';

class TeaUserView extends GetView<TeaUserController> {
  const TeaUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          drawer: NavigationDrawerWidget(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                SizedBox(height: 15.h),
                textFiledTitle(name: "Search"),
                MyTextField(
                  onChanged: (value) {
                    controller.serch(value!);
                    return null;
                  },
                  controller: controller.textEditingController,
                  textInputType: TextInputType.emailAddress,
                  hintText: "Search Something..",
                  validator: (p0) {
                    return AllTypeValidator.validateString(
                        p0, "Mobile Number is required");
                  },
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Obx(
                    () => controller.enrolledResponse.data.isBlank == true
                        ? Center(
                            child: Text(
                              "data not found",
                              style: Styles.medium6(
                                20,
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) => TechCardWidget(
                              eamil: controller.k?[index].email ?? "",
                              moblie: controller.k?[index].mobile ?? "",
                              name: controller.k?[index].firstName ?? "",
                              image: controller.k?[index].profile ?? "",
                            ),
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                            itemCount: controller.k?.length ?? 0,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class TechCardWidget extends StatelessWidget {
  const TechCardWidget({
    super.key,
    required this.name,
    required this.moblie,
    required this.eamil, required this.image,
  });

  final String name;
  final String moblie;
  final String eamil;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("$image"),
                onBackgroundImageError: (exception, stackTrace) {
                  if (stackTrace == StackTrace.current) {
                            Image.asset(
                              'assets/images/Placeholder.png',
                              fit: BoxFit.cover,
                            );
                          }
                },
                maxRadius: 35.h,
                backgroundColor: AppColors.primaryColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Styles.bold8(
                          20,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      Text(
                        eamil,
                        style: Styles.medium6(
                          16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        moblie,
                        style: Styles.medium6(
                          16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
