import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';

Widget noInternet() {
  return PopScope(
    canPop: true,
    child: Scaffold(
      key: GlobalKey(debugLabel: 'No Internet'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/no_internet.png',
              color: AppColors.primaryColor,
              height: 100,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: const Text(
              "No Internet connection",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text("Check your connection, then refresh the page."),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: () async {
              // You can also check the internet connection through this below function as well
              await Connectivity().checkConnectivity();
            },
            child: Text(
              "Refresh",
              style: Styles.regular4(16, color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    ),
  );
}
