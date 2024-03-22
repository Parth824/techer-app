import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:tech_lancer_teacher/app/core/constants/strings.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/navbar.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../utils/prc_assing.dart';
import '../controllers/tea_practice_controller.dart';

class TeaPracticeView extends GetView<TeaPracticeController> {
  const TeaPracticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Intercept back button press
        bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return exit; // Return true to exit if 'exit' is true, otherwise return false
      },
      child: Obx(
        () => Scaffold(
          drawer: const NavigationDrawerWidget(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await pickImageFromGallery(update: false);
            },
            backgroundColor: AppColors.primaryColor,
            label: Text(
              "Add New",
              style: Styles.medium6(
                14,
                color: AppColors.whiteColor,
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                SizedBox(height: 20.h),
                Text(
                  "PRACTICE LIST",
                  style: Styles.bold8(
                    22,
                    color: AppColors.darkGreyColor,
                  ),
                ),
                SizedBox(height: 16.h,),
                Expanded(
                  child: controller.assignmentResponse.data.isBlank == true
                      ? const Center(child: Text("data not found"))
                      : GridView.builder(
                          // shrinkWrap: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            // crossAxisCount: 2, // number of items in each row
                            // mainAxisSpacing: 4.0, // spacing between rows
                            // crossAxisSpacing: 8, // spacing between columns
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 20 / 30,
                          ),
                          padding: const EdgeInsets.all(
                              8.0), // padding around the grid
                          itemCount:
                              controller.assignmentResponse.data?.length ??
                                  0, // total number of items
                          itemBuilder: (context, index) {
                            return mainBody(
                                image: controller.assignmentResponse
                                        .data?[index].image?.first.res ??
                                    "",
                                index: index + 1,
                                id: controller
                                        .assignmentResponse.data?[index].id ??
                                    "");
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImageFromGallery({required bool update,String? id}) async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();
    if (res != null) {
      final file = File(res.files.single.path ?? "");
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb < 20) {
        if (res.files.single.path?.fileExtension() == "mp4") {
          Fluttertoast.showToast(
              msg: "Video Not Allow...", backgroundColor: Colors.red);
        } else {
          var formData = FormData.fromMap({
            "image": MultipartFile.fromFileSync(res.files.single.path ?? "",
                filename: res.files.single.path?.split("/").last),
          });
         (update)?await controller.tecAssignmentUpdate(formData: formData, id: id ?? "") :await controller.tecAssignmentInsert(formData: formData);
          await controller.getAssignment();
        }
      } else {
        Fluttertoast.showToast(
            msg: "Upload Image < 20 Mb Size", backgroundColor: Colors.red);
      }
      // var data = <String, dynamic>{};
      // var fData = FormData.fromMap(data);
      // fData.files.addAll([
      //   MapEntry(
      //       'video',
      //       MultipartFile.fromFileSync(res.path,
      //           filename: res.path.split("/").last))
      // ]);
      // controller.assingment.add(File(res.path));
      // await controller.tecAssignmentInsert(formData: formData);
      // await controller.getAssignment();
      // ignore: avoid_print
      print(controller.assingment);
    }
  }

  mainBody({required int index, required String image, required String id}) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () async {
            var url = image;
            if (url.fileExtension() == 'pdf') {
              controller.pdfDocument = await PDFDocument.fromURL(
                url,
              );
            } else {}

            Get.to(
              () => PracticesImageShow(
                imagePath: url,
                pdfDoc: controller.pdfDocument,
              ),
              transition: Transition.cupertino,
            );
          },
          child: Container(
            // color of grid items
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                image: ((image.split(".").last == "pdf"))
                    ? const DecorationImage(
                        image: AssetImage("assets/images/pdf.jpg"),
                        // image: ?AssetImage("assets/") :NetworkImage("$image"),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(image),
                        onError: (exception, stackTrace) {
                          if (stackTrace == StackTrace.current) {
                            Image.asset(
                              'assets/images/Placeholder.png',
                              fit: BoxFit.cover,
                            );
                          }
                        },
                        fit: BoxFit.cover,
                      )),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prectice Task $index",
                        style: Styles.medium6(
                          12,
                          color: (image.split(".").last == "pdf")?AppColors.blackColor:AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () async {
                              await controller.tecAssignmentDelete(id: id);
                              await controller.getAssignment();
                            },
                            value: 'delete',
                            enabled: true,
                            child: const Text('Delete'),
                          ),PopupMenuItem(
                            onTap: () async {
                              await pickImageFromGallery(update: true,id: id);
                              // await controller.getAssignment();
                            },
                            value: 'update',
                            enabled: true,
                            child: const Text('Update'),
                          ),


                        ],
                        icon:  Icon(
                          Icons.more_vert,
                          color: (image.split(".").last == "pdf")?AppColors.blackColor:AppColors.whiteColor,
                          // size: 1,
                        ),
                        // offset: Offset(0, 40),

                        elevation: 0,
                        position: PopupMenuPosition.under,
                        color: AppColors.whiteColor,
                        tooltip: "Menu",
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: AppColors.buttonColor.withOpacity(.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
