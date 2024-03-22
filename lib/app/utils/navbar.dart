import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(),
            Container(
              padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'DashBorad',
                    icon: LineIcons.dashcube,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Practice Question',
                    icon: LineIcons.pager,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'video',
                    icon: LineIcons.video,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'User',
                    icon: LineIcons.user,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Chat',
                    icon: LineIcons.facebookMessenger,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Logout',
                    icon: LineIcons.outdent,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() => InkWell(
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Teach Lancer",
                    style:
                        TextStyle(fontSize: 20, color: AppColors.darkGreyColor),
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.grey;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = AppColors.darkGreyColor;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.primaryColor,
        ),
        child: Icon(
          icon,
          color: AppColors.whiteColor,
          size: 30,
        ),
      ),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Get.offAllNamed(Routes.TEA_DASHBOARD);
        break;
      case 1:
        Get.offAllNamed(Routes.TEA_PRACTICE);
        break;
      case 2:
        Get.offAllNamed(Routes.TEA_VIDEO);
        break;
      case 3:
        Get.offAllNamed(Routes.TEA_USER);
        break;
      case 4:
        Get.offAllNamed(Routes.TEA_CHAT);
        break;
      case 5:
        await StorageService.clearTecLogin();
        await StorageService.clearTecToken();
        await StorageService.clearTecId();
        await StorageService.clearTecUniqeCode();
        await StorageService.clearCoreId();
        // await StorageService.clear();

        print(StorageService.getTecCoureId());
        Get.offAllNamed(Routes.LOG_IN);
        break;
    }
  }
}

Widget headMenu(BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Builder(builder: (context) {
      return InkWell(
          onTap: () {
            // Scaffold.of(context).closeEndDrawer();
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            height: 50.h,
            width: 160.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/menu.png",
                  width: 40.w,
                  height: 30.h,
                ),
                Text(
                  "Open Menu",
                  style: Styles.bold8(
                    18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ));
    }),
    trailing: Container(
      height: 40.h,
      width: 100.w,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          "Logout",
          style: Styles.medium6(18, color: Colors.white),
        ),
      ),
    ),
  );
}
