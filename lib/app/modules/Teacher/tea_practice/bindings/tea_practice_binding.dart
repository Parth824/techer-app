import 'package:get/get.dart';

import '../controllers/tea_practice_controller.dart';

class TeaPracticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TeaPracticeController>(
      TeaPracticeController(),
    );
  }
}
