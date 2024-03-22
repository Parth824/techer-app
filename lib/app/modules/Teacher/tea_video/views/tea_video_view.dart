import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/constants/enums.dart';
import 'package:tech_lancer_teacher/main.dart';
import 'package:video_player/video_player.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/core/theme/styles.dart';
import 'package:tech_lancer_teacher/app/modules/Teacher/tea_video/views/video_picker_page.dart';
import 'package:tech_lancer_teacher/app/utils/my_appbar.dart';
import 'package:tech_lancer_teacher/app/utils/navbar.dart';
import 'package:tech_lancer_teacher/app/utils/permission_denied_snackbar.dart';
import 'package:tech_lancer_teacher/app/utils/storage_permission_check.dart';
import '../controllers/tea_video_controller.dart';

class TeaVideoView extends GetView<TeaVideoController> {
  const TeaVideoView({Key? key}) : super(key: key);

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
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            storagePermissionCheck(
              onPermissionGranted: () async {
                await Get.to(
                  () => VideoPickerPage(update: false),
                  curve: Curves.easeInOut,
                  transition: Transition.fade,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                );
                controller.getVideo();
              },
              onPermissionDenied: () => permissionDeniedSnackBar(context),
            );
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
                "VIDEO LIST",
                style: Styles.bold8(
                  22,
                  color: AppColors.darkGreyColor,
                ),
              ),
              Expanded(
                child: Obx(
                  () => controller.videoResponse.data.isBlank == true
                      ? const Center(child: Text("data not found"))
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 20 / 30,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          itemCount: controller.videoResponse.data?.length ?? 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Obx(
                                () => controller.widgetState ==
                                        WidgetState.success
                                    ? VideoPlayerScreen(
                                        controller.videoResponse.data?[index]
                                                .video?[0].res ??
                                            '',
                                        controller.videoResponse.data?[index]
                                                .id ??
                                            '',
                                        index)
                                    : const Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                              ),
                            );
                          },
                        ),
                  //  controller.videoResponse.data.isBlank == true
                  //     ? const Center(child: Text("data not found"))
                  //     : GridView.builder(
                  //         padding: const EdgeInsets.all(8),
                  //         itemCount: controller.videoResponse.data?.length ?? 0,
                  //         itemBuilder: (context, index) {
                  //           return
                  //               // VideoPlay(
                  //               //   pathh: controller.videoResponse.data?[index].video
                  //               //           ?.first.res ??
                  //               //       "",
                  //               // );
                  //               imageGrid(
                  //                   context,
                  //                   controller.videoResponse.data?[index].video
                  //                           ?.first.res ??
                  //                       "",
                  //                   // controller.selectedImageKeys
                  //                   //     .contains(controller.box[index]),
                  //                   controller.videoResponse.data?.first.video ??
                  //                       <Video>[],
                  //                   controller.videoResponse.data?[index].id ??
                  //                       "");
                  //         },
                  //         gridDelegate:
                  //             const SliverGridDelegateWithMaxCrossAxisExtent(
                  //           maxCrossAxisExtent: 120,
                  //           mainAxisSpacing: 8,
                  //           crossAxisSpacing: 8,
                  //         ),
                  //       ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  VideoPlayerScreen(String videoUrl, String viewId, int index) {
    // late VideoPlayerController _videoPlayerController;

    // ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
    // VideoPlayerController? controller1;
    // late Future<void> futureController;

    // initVideo() {
    //   controller1 = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    //   futureController = controller1!.initialize();
    // }

    // initVideo();
    // controller1?.addListener(() {
    //   if (controller1!.value.isInitialized) {
    //     currentPosition.value = controller1!.value;
    //   }
    // });
    // controller.initVideo(videoUrl);

    // _videoPlayerController =
    //     VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    // _videoPlayerController.initialize();
    return Stack(
      children: [
        Positioned.fill(
          child: InkWell(
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    boxShadow: const [
                      BoxShadow(blurRadius: 2, color: Colors.black12)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Image.asset(
                          "assets/images/video_play.png",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          controller.videoResponse.data?[index].title ?? "",
                          style: Styles.bold8(
                            16,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          controller.videoResponse.data?[index].desc ?? "",
                          style: Styles.bold8(
                            14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            onTap: () {
              Get.to(() => VideoListItem(videoUrl: videoUrl));
            },
          ),
        ),
        Positioned.fill(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 160.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () async {
                          await controller.tecVideoDelete(id: viewId);
                          await controller.getVideo();
                        },
                        value: 'delete',
                        enabled: true,
                        child: const Text('Delete'),
                      ),
                      PopupMenuItem(
                        onTap: () async {
                          await Get.to(
                            () => VideoPickerPage(
                              update: true,
                              decs: controller.videoResponse.data?[index].desc,
                              id: viewId,
                              image: videoUrl,
                              tital:
                                  controller.videoResponse.data?[index].title,
                            ),
                            curve: Curves.easeInOut,
                            transition: Transition.fade,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                          await controller.getVideo();
                          // await controller.getAssignment();
                        },
                        value: 'update',
                        enabled: true,
                        child: const Text('Update'),
                      ),
                    ],
                    icon: Icon(
                      Icons.more_vert,
                      color:  AppColors.blackColor
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoListItem extends StatefulWidget {
  final String videoUrl;

  const VideoListItem({super.key, required this.videoUrl});

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio, // Adjust as needed
      autoInitialize: true,
      looping: false,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp
      ],

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
// class VideoPlay extends StatefulWidget {
//   String? pathh;

//   @override
//   // ignore: library_private_types_in_public_api
//   _VideoPlayState createState() => _VideoPlayState();

//   VideoPlay({
//     Key? key,
//     this.pathh, // Video from assets folder
//   }) : super(key: key);
// }

// class _VideoPlayState extends State<VideoPlay> {
//   ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
//   VideoPlayerController? controller;
//   late Future<void> futureController;

//   initVideo() {
//     controller = VideoPlayerController.networkUrl(Uri.parse(widget.pathh!));

//     futureController = controller!.initialize();
//   }

//   @override
//   void initState() {
//     initVideo();
//     controller!.addListener(() {
//       if (controller!.value.isInitialized) {
//         currentPosition.value = controller!.value;
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: futureController,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator.adaptive();
//         } else {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: SizedBox(
//               height: controller!.value.size.height,
//               width: double.infinity,
//               child: AspectRatio(
//                 aspectRatio: controller!.value.aspectRatio,
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                         child: Container(
//                             foregroundDecoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Colors.black.withOpacity(.7),
//                                     Colors.transparent
//                                   ],
//                                   stops: const [
//                                     0,
//                                     .1
//                                   ],
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter),
//                             ),
//                             child: VideoPlayer(controller!))),
//                     Positioned.fill(
//                       child: Column(
//                         children: [
//                           Expanded(
//                             flex: 8,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: GestureDetector(
//                                     onDoubleTap: () async {
//                                       Duration? position =
//                                           await controller!.position;
//                                       setState(() {
//                                         controller!.seekTo(Duration(
//                                             seconds: position!.inSeconds - 10));
//                                       });
//                                     },
//                                     child: const Icon(
//                                       Icons.fast_rewind_rounded,
//                                       color: Colors.black,
//                                       size: 40,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                     flex: 4,
//                                     child: IconButton(
//                                       icon: Icon(
//                                         controller!.value.isPlaying
//                                             ? Icons.pause
//                                             : Icons.play_arrow,
//                                         color: Colors.black,
//                                         size: 40,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           if (controller!.value.isPlaying) {
//                                             controller!.pause();
//                                           } else {
//                                             controller!.play();
//                                           }
//                                         });
//                                       },
//                                     )),
//                                 Expanded(
//                                   flex: 3,
//                                   child: GestureDetector(
//                                     onDoubleTap: () async {
//                                       Duration? position =
//                                           await controller!.position;
//                                       setState(() {
//                                         controller!.seekTo(Duration(
//                                             seconds: position!.inSeconds + 10));
//                                       });
//                                     },
//                                     child: const Icon(
//                                       Icons.fast_forward_rounded,
//                                       color: Colors.black,
//                                       size: 40,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: ValueListenableBuilder(
//                                 valueListenable: currentPosition,
//                                 builder: (context,
//                                     VideoPlayerValue? videoPlayerValue, w) {
//                                   return Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10),
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           videoPlayerValue!.position
//                                               .toString()
//                                               .substring(
//                                                   videoPlayerValue.position
//                                                           .toString()
//                                                           .indexOf(':') +
//                                                       1,
//                                                   videoPlayerValue.position
//                                                       .toString()
//                                                       .indexOf('.')),
//                                           style: const TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 22),
//                                         ),
//                                         const Spacer(),
//                                         Text(
//                                           videoPlayerValue.duration
//                                               .toString()
//                                               .substring(
//                                                   videoPlayerValue.duration
//                                                           .toString()
//                                                           .indexOf(':') +
//                                                       1,
//                                                   videoPlayerValue.duration
//                                                       .toString()
//                                                       .indexOf('.')),
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 2.h),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
