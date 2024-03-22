import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/TECHER/startLect_tec_req.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/TEACHER/startLect_res.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller2.dart';
import 'package:tech_lancer_teacher/app/data/repositories/auth_repository.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../data/models/response_dto/TEACHER/course_res.dart';
import '../../../../data/models/response_dto/TEACHER/enroller_res.dart';
import '../../../../data/models/response_dto/TEACHER/lecture_res.dart';
import '../../../../data/repositories/auth_repository2.dart';

class TeaDashboardController extends GetxController {
  //TODO: Implement TeaDashboardController

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late AuthRepository2 _authRepository2;
  late AuthRepository _authRepository;

  final _coursesResponse = CourseResponse().obs;
  CourseResponse get coursesResponse => _coursesResponse.value;
  set coursesResponse(CourseResponse value) => _coursesResponse.value = value;

  final _enrolledResponse = EnrolledUser().obs;
  EnrolledUser get enrolledResponse => _enrolledResponse.value;
  set enrolledResponse(EnrolledUser value) => _enrolledResponse.value = value;

  final _lectureResponse = LectureResponse().obs;
  LectureResponse get lectureResponse => _lectureResponse.value;
  set lectureResponse(LectureResponse value) => _lectureResponse.value = value;

  final _startLectureResponse = StartLectureResponse().obs;
  StartLectureResponse get startLectureResponse => _startLectureResponse.value;
  set startLectureResponse(StartLectureResponse value) =>
      _startLectureResponse.value = value;

  @override
  void onInit() async {
    
    _authRepository  = AuthRepository(apiController: Get.find<ApiController>());
    _authRepository2 =
        AuthRepository2(apiController: Get.find<ApiController2>());

    super.onInit();
  }

  @override
  void onReady() {
    callFirst();
    super.onReady();
  }

  void callFirst() async {
    await getCourse();
  }

  Future<void> getCourse() async {
    myLoader();
    final response = await _authRepository2.tecCoures();

    print(response);

    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        coursesResponse = CourseResponse.fromJson(r.data);

        if (coursesResponse.status == true) {
          await StorageService.setTecCoureId(coursesResponse.data!.first.id);
          print("SUCCESS: " "${coursesResponse.toString()}");
          await getEnrolled();
          await getLecture();
          // Get.toNamed(Routes.TEA_DASHBOARD);
        } else {
          mySnackbar(msg: coursesResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future<void> getEnrolled() async {
    final response = await _authRepository2.tecEnrolled();

    print(response);

    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        enrolledResponse = EnrolledUser.fromJson(r.data);

        if (enrolledResponse.status == true) {
          // await StorageService.setTecCoureId(coursesResponse.data!.first.id);
          print("SUCCESS: " "${enrolledResponse.data!.length}");
          // Get.toNamed(Routes.TEA_DASHBOARD);
        } else {
          mySnackbar(msg: coursesResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future<void> getLecture() async {
    final response = await _authRepository2.tecLecture();

    print(response);
    Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        lectureResponse = LectureResponse.fromJson(r.data);

        if (lectureResponse.status == true) {
          // await StorageService.setTecCoureId(coursesResponse.data!.first.id);
          print("SUCCESS: " "${lectureResponse.toString()}");
          // Get.toNamed(Routes.TEA_DASHBOARD);
        } else {
          mySnackbar(msg: coursesResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future<void> tecStartLect() async {
    if (formKey.currentState!.validate()) {
      myLoader();
      print(textEditingController.text);
      final response = await _authRepository.tecStartLec(
        requestDTO: StartLectRequestDto(
          link: textEditingController.text,
        ),
      );
      textEditingController.clear();
      Get.back();
      print(response);
      response.fold(
        (l) => mySnackbar(msg: l.message, msgIcon: "error"),
        (r) async {
          print(r.data);
          startLectureResponse = StartLectureResponse.fromJson(r.data);

          if (startLectureResponse.status == true) {
            print(startLectureResponse.message);
            Fluttertoast.showToast(
                msg: startLectureResponse.message.toString(),
                backgroundColor: Colors.green);
            Get.back();
          } else {
            mySnackbar(msg: startLectureResponse.message, msgIcon: "error");
          }
        },
      );
    }
  }
}
