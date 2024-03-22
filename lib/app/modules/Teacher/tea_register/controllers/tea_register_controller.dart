import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/modules/Teacher/log_in/controllers/log_in_controller.dart';

class TeaRegisterController extends GetxController {
  //TODO: Implement TeaRegisterController

  var techController = Get.find<LogInController>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController workEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController BioController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void userRegistration() {}

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
