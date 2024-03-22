import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  // final List<PopupMenuEntry<dynamic>> menuItem;
  const MyAppBar({
    super.key,
    // required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        "assets/images/logo.png",
        width: 180.w,
        height: 30.h,
      ),
      trailing: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      // trailing: PopupMenuButton(
      //   itemBuilder: (context) => menuItem,
      //   icon: const Icon(
      //     Icons.menu,
      //     size: 30,
      //   ),
      //   // offset: Offset(0, 40),
      //   elevation: 0,
      //   position: PopupMenuPosition.under,
      //   color: AppColors.whiteColor,
      //   tooltip: "Menu",
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5),
      //     side: BorderSide(
      //       color: AppColors.buttonColor.withOpacity(.5),
      //       style: BorderStyle.solid,
      //     ),
      //   ),
      // ),
    );
  }
}
