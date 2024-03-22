import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller2.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';

import '../../../../data/models/response_dto/TEACHER/enroller_res.dart';
import '../../../../data/repositories/auth_repository2.dart';

class TeaUserController extends GetxController {
  //TODO: Implement TeaUserController

  final count = 0.obs;
  TextEditingController textEditingController = TextEditingController();
  // TeaDashboardController? teaDashboardController;

  // List<Map<String, dynamic>> dataList = [
  //   {
  //     'name': "Parth",
  //     'Email': "Dhameliya300@gmail.com",
  //     'Mobile No': "9313433304"
  //   },
  //   {'name': "Om", 'Email': "Parth300@gmail.com", 'Mobile No': "9909346081"},
  //   {'name': "Raj", 'Email': "Om@gmail.com", 'Mobile No': "8140535450"},
  //   {'name': "Komal", 'Email': "Komal@gmail.com", 'Mobile No': "4941652314"},
  //   {'name': "Ronak", 'Email': "lol@gmail.com", 'Mobile No': "9313433304"},
  // ];

  final _userList = EnrolledUser().obs;
  EnrolledUser get userList => _userList.value;
  set userList(EnrolledUser value) => _userList.value = value;

  RxList<Datum>? k = <Datum>[].obs;

  // RxList<Datum>? _k = <Datum>[].obs;
  // RxList<Datum>? get k => _k.value;
  // set k(RxList<Datum>? value) => _k.value = value;

  // List k = [];

  late AuthRepository2 _authRepository;

  final _enrolledResponse = EnrolledUser().obs;
  EnrolledUser get enrolledResponse => _enrolledResponse.value;
  set enrolledResponse(EnrolledUser value) => _enrolledResponse.value = value;

  @override
  void onInit() async {
    _authRepository =
        AuthRepository2(apiController: Get.find<ApiController2>());

    super.onInit();
  }

  @override
  void onReady() {
    callFirst();
    super.onReady();
  }

  void callFirst() async {
    await getEnrolled();
  }

  Future<void> getEnrolled() async {
    myLoader();
    final response = await _authRepository.tecEnrolled();

    print(response);
    Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        enrolledResponse = EnrolledUser.fromJson(r.data);

        if (enrolledResponse.status == true) {
          // await StorageService.setTecCoureId(coursesResponse.data!.first.id);
          print("SUCCESS: " "${enrolledResponse.data!.length}");
          // Get.toNamed(Routes.TEA_DASHBOARD);
          userList = enrolledResponse;
          serch("");
        } else {
          mySnackbar(msg: enrolledResponse.message, msgIcon: "error");
        }
      },
    );
  }

  serch(String value) {
    List<Datum>? result = [];
    if (value.isEmpty) {
      k?.value = userList.data ?? <Datum>[];

      print(userList);
      return;
    } else {
      result = userList.data
              ?.where((element) =>
                  element.firstName
                      ?.toLowerCase()
                      .contains(value.toLowerCase()) ==
                  true)
              .toList() ??
          [];
      k?.value = result;
    }
  }
}
