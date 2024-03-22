import 'package:get/get.dart';

import '../controllers/tea_dashboard_controller.dart';

class TeaDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TeaDashboardController>(
      TeaDashboardController(),
    );
  }
}
