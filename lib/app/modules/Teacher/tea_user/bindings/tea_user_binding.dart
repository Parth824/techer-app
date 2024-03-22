import 'package:get/get.dart';

import '../controllers/tea_user_controller.dart';

class TeaUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaUserController>(
      () => TeaUserController(),
    );
  }
}
