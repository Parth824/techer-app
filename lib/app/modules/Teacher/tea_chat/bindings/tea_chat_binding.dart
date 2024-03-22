import 'package:get/get.dart';

import '../controllers/tea_chat_controller.dart';

class TeaChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TeaChatController>(
       TeaChatController(),
    );
  }
}
