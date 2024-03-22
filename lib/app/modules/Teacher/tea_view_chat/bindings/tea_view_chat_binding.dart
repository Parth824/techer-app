import 'package:get/get.dart';

import '../controllers/tea_view_chat_controller.dart';

class TeaViewChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaViewChatController>(
      () => TeaViewChatController(),
    );
  }
}
