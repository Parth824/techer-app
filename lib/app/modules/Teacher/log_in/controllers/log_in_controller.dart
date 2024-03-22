import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/USR/login_req.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/USR/login_response.dart';
import 'package:tech_lancer_teacher/app/routes/app_pages.dart';
import 'package:tech_lancer_teacher/app/utils/grid_card_model.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';

import '../../../../data/networks/api_controller2.dart';
import '../../../../data/repositories/auth_repository2.dart';

class LogInController extends GetxController {
  //TODO: Implement LogInController
  TextEditingController workEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final List<GridImageModel> imageList = [
    GridImageModel(
        imagePath: "assets/images/ss1.png",
        imageTitle: "SALES TALENTS",
        imageSubTitle: '500+'),
    GridImageModel(
        imagePath: "assets/images/ss2.png",
        imageTitle: "SALES SKILLS",
        imageSubTitle: '100+'),
    GridImageModel(
        imagePath: "assets/images/ss3.png",
        imageTitle: "VERIFIED SALES TALENTS",
        imageSubTitle: '100%'),
    GridImageModel(
        imagePath: "assets/images/ss4.png",
        imageTitle: "COMPANIES\nONBOARD",
        imageSubTitle: '25+'),
  ];

  List<PopupMenuEntry> popupMenuList = [
    // PopupMenuItem(
    //   value: 'home',
    //   child: Text('Home'),
    //   onTap: () => Get.offAndToNamed(Routes.USR_SALES_ACADEMY),
    // ),
    PopupMenuItem(
      value: 'video',
      child: Text('Video'),
    ),
    PopupMenuItem(
      value: 'work',
      child: DropdownButton<String>(
        onChanged: (String? newValue) {
          switch (newValue) {
            case "Job":
              print("Job selected");
              break;
            case "Internship":
              print("internship selected");
              break;
          }
        },
        items:
            ["Job", "Internship"].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text("Work"),
        underline: SizedBox(),
        elevation: 0,
        isExpanded: true,
        dropdownColor: AppColors.whiteColor,
      ),
    ),
    PopupMenuItem(
      value: 'contact',
      child: Text('Contact'),
    ),
    PopupMenuItem(
      value: 'chat',
      child: Text('Chat'),
    ),
    PopupMenuItem(
      value: 'signup',
      enabled: true,
      child: Text('Sign Up'),
      onTap: () => Get.toNamed(Routes.TEA_REGISTER),
    ),
    PopupMenuItem(
      value: 'login',
      child: Text('Login'),
      onTap: () => Get.toNamed(Routes.LOG_IN),
    ),
    // PopupMenuItem(
    //   value: 'dashboard',
    //   child: Text('Dashboard'),
    //   onTap: () => Get.toNamed(Routes.USR_DASHBOARD),
    // ),
  ];

  late AuthRepository2 _authRepository;

  final _loginResponse = LoginResponse().obs;
  LoginResponse get loginResponse => _loginResponse.value;
  set loginResponse(LoginResponse value) => _loginResponse.value = value;

  final _passwordShow = false.obs;
  bool get passwordShow => _passwordShow.value;
  set passwordShow(bool value) => _passwordShow.value = value;

  @override
  void onInit() {
    _authRepository =
        AuthRepository2(apiController: Get.find<ApiController2>());

    super.onInit();
  }

  void passwordVisibility() {
    passwordShow = !passwordShow;
  }

  Future<void> tecLogIn() async {
    if (formKey.currentState!.validate()) {
      myLoader();
      final response = await _authRepository.tecLogin(
        requestDTO: LoginRequestDto(
          email: workEmailController.text,
          password: passwordController.text,
        ),
      );
      Get.back();
      print(response);
      response.fold(
        (l) => mySnackbar(msg: l.message, msgIcon: "error"),
        (r) async {
          print(r.data);
          loginResponse = LoginResponse.fromJson(r.data);

          if (loginResponse.status == true) {
            await StorageService.setTecToken(loginResponse.token);
            await StorageService.setTecId(loginResponse.teacherId);
            await StorageService.setTecUniqeCode(loginResponse.uniqueCode);
            await StorageService.setTecLogin(true);

            print(StorageService.getTecId());
            print(StorageService.getTecUniqeCode());
            print(StorageService.getTecToken());

            mySnackbar(msg: loginResponse.message, msgIcon: "success");
            Get.offAndToNamed(Routes.TEA_DASHBOARD);
          } else {
            mySnackbar(msg: loginResponse.message, msgIcon: "error");
          }
        },
      );
    }
  }
}
