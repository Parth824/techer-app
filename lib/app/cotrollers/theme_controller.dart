import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/storage_service.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getSavedThemeMode();
  }

  ThemeMode themeMode = ThemeMode.system;

  Future<void> setThemeMode(ThemeMode theme) async {
    Get.changeThemeMode(theme);
    themeMode = theme;
    StorageService.setTheme(themeMode.name);
    update();
  }

  getSavedThemeMode() async {
    var savedTheme = StorageService.getTheme() ?? "system";
    // import 'package:flutter/foundation.dart';for this
    themeMode = ThemeMode.values.firstWhere((e) => e.name == savedTheme);
    Get.changeThemeMode(themeMode);
    update();
  }
}
