import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/TEACHER/chatModel.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/TEACHER/group_chat_res.dart';
import 'package:tech_lancer_teacher/app/data/models/response_dto/TEACHER/group_res.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller.dart';
import 'package:tech_lancer_teacher/app/data/repositories/auth_repository.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';

class TeaViewChatController extends GetxController {
  //TODO: Implement TeaViewChatController

  late IO.Socket socket;
  Timer? timer;
  TextEditingController chatTextController = TextEditingController();

  final _chatList = RxList().obs;
  RxList get chatList => _chatList.value;
  set chtList(RxList value) => _chatList.value = value;

  ScrollController scrollController = ScrollController();

  final _Messages = RxList<ChatMessage>().obs;
  RxList<ChatMessage> get Messages => _Messages.value;
  set Messages(RxList<ChatMessage> value) => _Messages.value = value;

  final _groupResponse = GruopResponse().obs;
  GruopResponse get groupResponse => _groupResponse.value;
  set groupResponse(GruopResponse value) => _groupResponse.value = value;

  late AuthRepository _authRepository;

  final _chatViewResponse = ChatViewResponse().obs;
  ChatViewResponse get chatViewResponse => _chatViewResponse.value;
  set chatViewResponse(ChatViewResponse value) =>
      _chatViewResponse.value = value;

  @override
  void onInit() async {
    _authRepository = AuthRepository(apiController: Get.find<ApiController>());
    connectToServer();
    super.onInit();
  }


   @override
  void onReady() {
    callFirst();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getAllChat());
    super.onReady();
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  void connectToServer() {
    socket = IO.io('http://3.7.145.66:8000', <String, dynamic>{
      'autoConnect': false,
      // 'forceNew': true,
      'transports': ['websocket'],
    });
    // socket = IO.io('https://teach-lancer.onrender.com', <String, dynamic>{
    //   'autoConnect': false,
    //   // 'forceNew': true,
    //   'transports': ['websocket'],
    // });
    
    socket.connect();

    socket.onConnect((_) {
      print("Connection established");
    });
    socket.onDisconnect((_) => print("connection Disconnection"));
    socket.onConnectError((err) => print("EonConnectError $err"));
    socket.onError((err) => print("EonConnectError $err"));

    // joinedRoom({"group_id": "User${StorageService.getTecGroupId()}"});
    socket.hasListeners;
  }

  void joinedRoom(Map map) {
    socket.emit('joinRoom', map);
  }

  void sendMessage() async {
    if (chatTextController.text.isNotEmpty) {
      print("Parth");
      // joinedRoom({"user_id": "User${receiver.id}"});
      print(StorageService.getTecGroupId());
      print(StorageService.getTecId());
      print(chatTextController.text);
      socket.emit('groupChat', {
        "group_id": StorageService.getTecGroupId(),
        "sender_id": StorageService.getTecId(),
        "message": chatTextController.text,
      });
      print("Parth");
      chatTextController.clear();
    }
  }
 
 void callFirst() async {
    await getGroup();
  }
  
 getAllChat() async {
    // myLoader();
    final response = await _authRepository.tecViewGruop();

    print(response);
    // Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        chatViewResponse = ChatViewResponse.fromJson(r.data);
        if (chatViewResponse.status == true) {
          print("SUCCESS: " "${chatViewResponse.toString()}");
        } else {
          // mySnackbar(msg: chatViewResponse.message, msgIcon: "error");
        }
      },
    );
  }

  void _handleMessage(dynamic data) {
    print("--${data['chat']}");

    // messages.add(data['chat']);
    update();
  }

  Future<void> getGroup() async {
    // myLoader();
    final response = await _authRepository.tecGruop();

    print(response);
    // Get.back();
    response.fold(
      (l) => mySnackbar(msg: l.message, msgIcon: "error"),
      (r) async {
        print(r.data);
        groupResponse = GruopResponse.fromJson(r.data);

        if (groupResponse.status == true) {
          
        await getAllChat();
          print("SUCCESS: " "${groupResponse.toString()}");
        } else {
          mySnackbar(msg: groupResponse.message, msgIcon: "error");
        }
      },
    );
  }  

  void sendMess() async{
    if (chatTextController.text.isNotEmpty) {
      sendMessage();
      await getAllChat();
      // getAllChatByRoom(chatRoomId);

      chatTextController.clear();

      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    }
  }
}
