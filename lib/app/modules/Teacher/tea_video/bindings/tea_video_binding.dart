import 'package:get/get.dart';

import '../controllers/tea_video_controller.dart';

class TeaVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeaVideoController>(
      () => TeaVideoController(),
    );
  }
}
