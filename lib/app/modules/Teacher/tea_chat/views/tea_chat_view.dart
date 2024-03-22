import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/navbar.dart';
import '../controllers/tea_chat_controller.dart';

class TeaChatView extends GetView<TeaChatController> {
  const TeaChatView({Key? key}) : super(key: key);
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
        drawer: const NavigationDrawerWidget(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "CHAT",
                style: Styles.bold8(22, color: AppColors.darkGreyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Obx(() => controller.groupResponse.data.isBlank == true
                    ? const Center(child: Text("data not found"))
                    : ListView.builder(
                        itemCount: controller.groupResponse.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              Get.toNamed(Routes.TEA_VIEW_CHAT);
                              // await controller.getAllChat();
                            },
                            child: mainbody(
                              image: controller
                                      .groupResponse.data?.first.groupImg ??
                                  "",
                              name: controller
                                      .groupResponse.data?.first.groupName ??
                                  "kk",
                              des: controller
                                      .groupResponse.data?.first.groupDesc ??
                                  "",
                            ),
                          );
                        },
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  mainbody({required String image, required String name, required String des}) {
    return Column(
      children: [
        // ignore: avoid_unnecessary_containers
        Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                backgroundImage: NetworkImage(image),
                maxRadius: 35.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Styles.bold8(
                        22,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    Text(
                      des,
                      style: Styles.bold8(
                        14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        const Divider(),
      ],
    );
  }
}
