import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/modules/Teacher/tea_video/controllers/tea_video_controller.dart';
import 'package:tech_lancer_teacher/app/utils/all_validator.dart';
import 'package:tech_lancer_teacher/app/utils/gallery_model.dart';
import 'package:tech_lancer_teacher/app/utils/my_textfield.dart';

class HideVideosButton extends StatefulWidget {
  final List<AssetEntity> selectedAssets;
  final Function onHideComplete;
  final bool update;
  String? tital;
  String? des;
  String? image;
  String? id;

  HideVideosButton(
      {Key? key,
      required this.selectedAssets,
      required this.onHideComplete,
      required this.update,
      this.tital,
      this.des,
      this.image,this.id})
      : super(key: key);

  @override
  State<HideVideosButton> createState() => _HideVideosButtonState();
}

class _HideVideosButtonState extends State<HideVideosButton> {
  bool hiding = false;
  TextEditingController tital = TextEditingController();
  TextEditingController dsc = TextEditingController();

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hiding) {
      return FloatingActionButton(
        onPressed: () => hide(),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    } else {
      return FloatingActionButton.extended(
        onPressed: () => hide(),
        label: Text("Videos (${widget.selectedAssets.length})"),
      );
    }
  }

  Future<File> convertUrlToFile(String imageUrl) async {
    var rng = Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath${rng.nextInt(100)}.png');
    http.Response response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Future<void> hide() async {
    tital.text = widget.tital ?? "";
    dsc.text = widget.des ?? "";

    await showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400.h,
          child: AlertDialog(
            title: Center(
              child: Text(
                "VIDEO UPLOAD",
                style: Styles.bold8(22, color: AppColors.darkGreyColor),
              ),
            ),
            content: SizedBox(
              height: 200.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFiledTitle(name: "Title*"),
                  MyTextField(
                    controller: tital,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Title",
                    validator: (p0) {
                      return AllTypeValidator.validateString(
                          p0, "Title is required");
                    },
                  ),
                  SizedBox(height: 15.h),
                  textFiledTitle(name: "Description*"),
                  MyTextField(
                    controller: dsc,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Description",
                    validator: (p0) {
                      return AllTypeValidator.validateString(
                          p0, "Description is required");
                    },
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        );
      },
    );
    setState(() => hiding = true);
    // final box = Hive.box<Gallery>('gallery');
    TeaVideoController teaVideoController = Get.put(TeaVideoController());
    List<String> alreadyHiddenImagesPath = [];
    teaVideoController.box.toList().forEach((image) {
      return alreadyHiddenImagesPath.add(image.localPath);
    });
    int saveImageCount = 0; 
    if (widget.update == true && widget.selectedAssets.isEmpty) {
      File imageFile = await convertUrlToFile(widget.image ?? "");
      final file = File(imageFile.path);
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);

      if (sizeInMb < 20) {
        var data = <String, dynamic>{
          'title': tital.text,
          'desc': dsc.text,
        };
        var fData = FormData.fromMap(data);
        fData.files.addAll([
          MapEntry(
              'video',
              MultipartFile.fromFileSync(imageFile.path,
                  filename: imageFile.path.split("/").last))
        ]);
        await teaVideoController.tecVideoUpdate(formData: fData,id: widget.id ?? "");
        // await teaVideoController.getVideo();
        // await File(imageFile.path).delete();
        // print(imageFile.path);
        saveImageCount++;
      }
      } else {
        for (var asset in widget.selectedAssets) {
          var imageFile = await asset.loadFile();
          if (imageFile != null) {
            var thumbnailBytes = await asset.thumbnailDataWithSize(
              const ThumbnailSize.square(256),
            );
            if (thumbnailBytes != null) {
              // print(asset.duration);
              final file = File(imageFile.path);
              int sizeInBytes = file.lengthSync();
              double sizeInMb = sizeInBytes / (1024 * 1024);

              if (sizeInMb < 20) {
                teaVideoController.box.add(
                  Gallery(
                    description: dsc.text,
                    title: tital.text,
                    type: 'video',
                    thumbnailBytes: thumbnailBytes,
                    bytes: imageFile.readAsBytesSync(),
                    dateTime: asset.createDateTime,
                    localPath: imageFile.path,
                  ),
                );
                var data = <String, dynamic>{
                  'title': tital.text,
                  'desc': dsc.text,
                };
                var fData = FormData.fromMap(data);
                fData.files.addAll([
                  MapEntry(
                      'video',
                      MultipartFile.fromFileSync(imageFile.path,
                          filename: imageFile.path.split("/").last))
                ]);
              widget.update == true ?  await teaVideoController.tecVideoUpdate(formData: fData,id: widget.id ?? "") :await teaVideoController.tecVideoInsert(formData: fData);
                // await teaVideoController.getVideo();
                // await File(imageFile.path).delete();
                // print(imageFile.path);
                saveImageCount++;
                
                
              } else {}
            }
          }
        }
      }
      if (saveImageCount != 0) {
        Fluttertoast.showToast(
          msg: "successfully",
          backgroundColor: Colors.green,
        );
      } else {
        Fluttertoast.showToast(
            msg: "Upload Voide < 20 Mb Size", backgroundColor: Colors.red);
      }
      setState(() => hiding = false);
      widget.onHideComplete();
    }
  }

