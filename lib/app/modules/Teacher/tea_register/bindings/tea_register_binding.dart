import 'package:get/get.dart';

import '../controllers/tea_register_controller.dart';

class TeaRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaRegisterController>(
      () => TeaRegisterController(),
    );
  }
}
