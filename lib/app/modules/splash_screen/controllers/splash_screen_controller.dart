import 'dart:async';

import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final _opacity = 1.0.obs;
  double get opacity => _opacity.value;
  set opacity(double value) => _opacity.value = value;

  @override
  void onInit() {
    Timer(Duration(seconds: 5), () {
      bool Login = StorageService.getTecLogin() ?? false;
      print(Login);
      Login ? Get.offAllNamed(Routes.TEA_DASHBOARD) : Get.offAllNamed(Routes.LOG_IN);
    });
    super.onInit();
  }
}
