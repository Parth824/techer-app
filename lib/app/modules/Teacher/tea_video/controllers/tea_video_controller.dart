import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:tech_lancer_teacher/app/utils/gallery_model.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/enums.dart';
import '../../../../data/models/response_dto/TEACHER/video_detele_res.dart';
import '../../../../data/models/response_dto/TEACHER/voide_req.dart';
import '../../../../data/networks/api_controller.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../utils/my_snackbar.dart';

class TeaVideoController extends GetxController {
  final count = 0.obs;
  // RxList<Gallery> box = <Gallery>[].obs;
  // ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  // VideoPlayerController? controller1;
  // late Future<void> futureController;

  // initVideo(String image) {
  //   controller1 = VideoPlayerController.networkUrl(Uri.parse(image));

  //   futureController = controller1!.initialize();
  // }

  // imageVideo(String image) async {
  //   final filename = await VideoThumbnail.thumbnailFile(
  //     video: image,
  //     thumbnailPath: (await getTemporaryDirectory()).path,
  //     imageFormat: ImageFormat.JPEG,
  //     maxHeight:
  //         64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
  //     quality: 75,
  //   );
  //   return filename ?? "";
  // }

  final _box = RxList<Gallery>().obs;
  RxList<Gallery> get box => _box.value;
  set box(RxList<Gallery> value) => _box.value = value;

  List<int> selectedImageKeys = [];
  late AuthRepository _authRepository;

  final _widgetState = WidgetState.initial.obs;
  WidgetState get widgetState => _widgetState.value;
  set widgetState(WidgetState value) => _widgetState.value = value;

  // final _courseState = WidgetState.initial.obs;
  // WidgetState get courseState => _courseState.value;
  // set courseState(WidgetState value) => _courseState.value = value;

  // final _videoController = VideoPlayerController.networkUrl(Uri()).obs;
  // VideoPlayerController get videoController => _videoController.value;
  // set videoController(VideoPlayerController value) =>
  //     _videoController.value = value;

  ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  VideoPlayerController? controller1;
  late Future<void> futureController;

  // initVideo(String videoUrl) {
  //   controller1 = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
  //   futureController = controller1!.initialize();
  //   controller1?.addListener(() {
  //     if (controller1!.value.isInitialized) {
  //       currentPosition.value = controller1!.value;
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller1?.dispose();
  //   currentPosition.dispose();
  //   super.dispose();
  // }

  final _videoController = VideoPlayerController.networkUrl(Uri()).obs;
  VideoPlayerController get videoController => _videoController.value;
  set videoController(VideoPlayerController value) =>
      _videoController.value = value;

  final _videoResponse = VideoResponse().obs;
  VideoResponse get videoResponse => _videoResponse.value;
  set videoResponse(VideoResponse value) => _videoResponse.value = value;

  final _playPauseVid = false.obs;
  bool get playPauseVid => _playPauseVid.value;
  set playPauseVid(bool value) => _playPauseVid.value = value;

  // final _imageResponse = ImageResponse().obs;
  // ImageResponse get imageResponse => _imageResponse.value;
  // set imageResponse(ImageResponse value) => _imageResponse.value = value;

  final _videoDeleteResponse = VideoDeleteResponse().obs;
  VideoDeleteResponse get videoDeleteResponse => _videoDeleteResponse.value;
  set videoDeleteResponse(VideoDeleteResponse value) =>
      _videoDeleteResponse.value = value;

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
    await getVideo();
  }

  Future<void> getVideo() async {
    widgetState = WidgetState.loading;
    // myLoader();
    final response = await _authRepository.tecVideo();

    // ignore: avoid_print
    print(response);
    // Get.back();
    response.fold(
      (l) {
        widgetState = WidgetState.error;
        mySnackbar(msg: l.message, msgIcon: "error");
      },
      (r) async {
        // ignore: avoid_print
        print(r.data);
        videoResponse = VideoResponse.fromJson(r.data);
        widgetState = WidgetState.success;

        if (videoResponse.status == true) {
          // ignore: avoid_print
          print("SUCCESS: " "${videoResponse.toString()}");
        } else {
          mySnackbar(msg: videoResponse.message, msgIcon: "error");
        }

        videoResponse.data?.map((e) {
          e.video?.map(
            (e) async {
              videoController = VideoPlayerController.network("${e.res}");

              await videoController.initialize();
              update();

              widgetState = WidgetState.success;
            },
          ).toList();
        }).toList();
      },
    );
  }

  Future tecVideoDelete({required String id}) async {
    myLoader();
    final response = await _authRepository.tecVideoDelete(id: id);

    // ignore: avoid_print
    print(response);
    Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        // ignore: avoid_print
        print(r.data);
        videoDeleteResponse = VideoDeleteResponse.fromJson(r.data);

        if (videoDeleteResponse.status == true) {
          // ignore: avoid_print
          print("SUCCESS: " "${videoDeleteResponse.toString()}");
        } else {
          mySnackbar(msg: videoDeleteResponse.message, msgIcon: "error");
        }
      },
    );
  }

  Future<void> tecVideoInsert({required FormData formData}) async {
    myLoader();
    final response = await _authRepository.tecVideoInsert(formData: formData);
    Get.back();
    // ignore: avoid_print
    print(response);
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        // ignore: avoid_print
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


  Future<void> tecVideoUpdate({required FormData formData,required String id}) async {
    myLoader();
    final response = await _authRepository.tecVideoUpdate(formData: formData,Id: id);
    Get.back();
    // ignore: avoid_print
    print(response);
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        // ignore: avoid_print
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
