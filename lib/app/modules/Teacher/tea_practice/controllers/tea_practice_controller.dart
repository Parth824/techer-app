import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:image_picker/image_picker.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/TEACHER/assignment_req.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller.dart';
import 'package:tech_lancer_teacher/app/data/repositories/auth_repository.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';
import '../../../../data/models/response_dto/TEACHER/assignment_delete_res.dart';
import '../../../../data/models/response_dto/TEACHER/assignment_res.dart';

class TeaPracticeController extends GetxController {
  //TODO: Implement TeaPracticeController

  final count = 0.obs;

  // RxList assingment = [].obs;

  final _assingment = RxList<File>().obs;
  RxList<File> get assingment => _assingment.value;
  set assingment(RxList<File> value) => _assingment.value = value;

  // var assingment = RxList.empty(growable: true);
  File? file;

  ImagePicker imagePicker = ImagePicker();

  List<PopupMenuEntry<dynamic>> menuItem = [
    const PopupMenuItem(
      
      value: 'delete',
      enabled: true,
      child: Text('Delete'),
    ),
    const PopupMenuItem(
      
      value: 'update',
      enabled: true,
      child: Text('Update'),
    ),
  ];

  late AuthRepository _authRepository;

  PDFDocument pdfDocument = PDFDocument();

  final _assignmentResponse = AssignmentResponse().obs;
  AssignmentResponse get assignmentResponse => _assignmentResponse.value;
  set assignmentResponse(AssignmentResponse value) =>
      _assignmentResponse.value = value;

  final _imageResponse = AssignmentInsertResponse().obs;
  AssignmentInsertResponse get imageResponse => _imageResponse.value;
  set imageResponse(AssignmentInsertResponse value) =>
      _imageResponse.value = value;

   final _assingmentDeleteResponse = AssingmentDeleteResponse().obs;
  AssingmentDeleteResponse get assingmentDeleteResponse => _assingmentDeleteResponse.value;
  set assingmentDeleteResponse(AssingmentDeleteResponse value) =>
      _assingmentDeleteResponse.value = value;

  @override
  void onInit() {
    _authRepository = AuthRepository(apiController: Get.find<ApiController>());

    super.onInit();
  }

  @override
  void onReady() {
    callFirst();
    super.onReady();
  }

  void callFirst() async {
    await getAssignment();
  }

  Future<void> getAssignment() async {
    myLoader();
    final response = await _authRepository.tecAssignmentGet();

    print(response);
    Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        assignmentResponse = AssignmentResponse.fromJson(r.data);

        if (assignmentResponse.status == true) {
          print("SUCCESS: " "${assignmentResponse.toString()}");
        } else {
          mySnackbar(msg: assignmentResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future tecAssignmentDelete({required String id})
 async {
    myLoader();
    final response = await _authRepository.tecAssignmentDelete(id: id);

    print(response);
    Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        assingmentDeleteResponse = AssingmentDeleteResponse.fromJson(r.data);

        if (assingmentDeleteResponse.status == true) {
          print("SUCCESS: " "${assingmentDeleteResponse.toString()}");
        } else {
          mySnackbar(msg: assingmentDeleteResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future<void> tecAssignmentInsert(
      {required FormData formData}) async {
    myLoader();
    final response =
        await _authRepository.tecAssignment(formData: formData);
    Get.back();
    print(response);
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        // imageResponse = ImageResponse.fromJson(r.data);

        // if (imageResponse.status == true) {
        //   mySnackbar(msg: loginResponse.message, msgIcon: "success");
        //   Get.toNamed(Routes.TEA_DASHBOARD);
        // } else {
        //   mySnackbar(msg: loginResponse.message, msgIcon: "error");
        // }
      },
    );
  }

  Future<void> tecAssignmentUpdate(
      {required FormData formData,required String id}) async {
    myLoader();
    final response =
        await _authRepository.tecAssignmentUpdate(formData: formData,id: id);
    Get.back();
    print(response);
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        // imageResponse = ImageResponse.fromJson(r.data);

        // if (imageResponse.status == true) {
        //   mySnackbar(msg: loginResponse.message, msgIcon: "success");
        //   Get.toNamed(Routes.TEA_DASHBOARD);
        // } else {
        //   mySnackbar(msg: loginResponse.message, msgIcon: "error");
        // }
      },
    );
  }
}
