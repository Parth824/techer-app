import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/modules/Teacher/tea_chat/controllers/tea_chat_controller.dart';

class ChatDetailPage extends GetView<TeaChatController> {
  const ChatDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        controller.timer?.cancel();
        Get.back();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      controller.timer?.cancel();
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: NetworkImage(
                        controller.groupResponse.data?.first.groupImg ?? ""),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          controller.groupResponse.data?.first.groupName ?? "",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        // Text(
                        //   "Online",
                        //   style: TextStyle(
                        //       color: Colors.grey.shade600, fontSize: 13),
                        // ),
                      ],
                    ),
                  ),
                  // const Icon(
                  //   Icons.settings,
                  //   color: Colors.black54,
                  // ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Obx(() => Column(
                  children: [
                    Flexible(
                      child: ListView(
                        reverse: true,
                        children: [
                          ListView.builder(
                            itemCount: controller
                                    .chatViewResponse.data?.chat?.length ??
                                0,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10, bottom: 50),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 14,
                                        right: 14,
                                        top: 10,
                                        bottom: 10),
                                    child: Align(
                                      alignment: (controller.chatViewResponse
                                                  .data?.chat?[index].sender !=
                                              StorageService.getTecId()
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: (controller
                                                      .chatViewResponse
                                                      .data
                                                      ?.chat?[index]
                                                      .sender !=
                                                  StorageService.getTecId()
                                              ? Colors.grey.shade200
                                              : Colors.blue[200]),
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          controller.chatViewResponse.data
                                                  ?.chat?[index].message ??
                                              "",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    // GestureDetector(
                    //   onTap: (){
                    //   },
                    //   child: Container(
                    //     height: 30,
                    //     width: 30,
                    //     decoration: BoxDecoration(
                    //       color: Colors.lightBlue,
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    //   ),
                    // ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.chatTextController,
                        decoration: const InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      // onTap: () {
                      // controller.Messages.add(ChatMessage(
                      //     messageContent: controller.chatTextController.text,
                      //     messageType: "sender"));
                      // controller.chatTextController.clear();
                      // if (controller.scrollController.hasClients) {
                      //   controller.scrollController.jumpTo(controller
                      //       .scrollController.position.maxScrollExtent);
                      // }
                      // },
                      onTap: controller.sendMess,
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
