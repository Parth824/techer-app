import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';

import '../core/services/storage_service.dart';
import '../data/models/response_dto/COMPANY/cmp_reg_res.dart';

class AppController extends GetxController {
  bool firstTimeCheckForNavigaion = true;

  
  final _cmpRegisterRes = CmpRegisterResModel().obs;
  CmpRegisterResModel get cmpRegisterRes => _cmpRegisterRes.value;
  set cmpRegisterRes(CmpRegisterResModel value) =>
      _cmpRegisterRes.value = value;
  

  void checkAuthStatus() {
    final token = StorageService.getToken();
    if (token != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
