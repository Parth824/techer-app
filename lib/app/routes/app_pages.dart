import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/Teacher/log_in/bindings/log_in_binding.dart';
import '../modules/Teacher/log_in/views/log_in_view.dart';
import '../modules/Teacher/tea_chat/bindings/tea_chat_binding.dart';
import '../modules/Teacher/tea_chat/views/chat_page_view.dart';
import '../modules/Teacher/tea_chat/views/tea_chat_view.dart';
import '../modules/Teacher/tea_dashboard/bindings/tea_dashboard_binding.dart';
import '../modules/Teacher/tea_dashboard/views/tea_dashboard_view.dart';
import '../modules/Teacher/tea_practice/bindings/tea_practice_binding.dart';
import '../modules/Teacher/tea_practice/views/tea_practice_view.dart';
import '../modules/Teacher/tea_register/bindings/tea_register_binding.dart';
import '../modules/Teacher/tea_register/views/tea_register_view.dart';
import '../modules/Teacher/tea_user/bindings/tea_user_binding.dart';
import '../modules/Teacher/tea_user/views/tea_user_view.dart';
import '../modules/Teacher/tea_video/bindings/tea_video_binding.dart';
import '../modules/Teacher/tea_video/views/tea_video_view.dart';
import '../modules/Teacher/tea_view_chat/bindings/tea_view_chat_binding.dart';
import '../modules/Teacher/tea_view_chat/views/tea_view_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: _Paths.LOG_IN,
        page: () => const LogInView(),
        binding: LogInBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: _Paths.TEA_REGISTER,
        page: () => const TeaRegisterView(),
        binding: TeaRegisterBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: _Paths.TEA_DASHBOARD,
      page: () => const TeaDashboardView(),
      binding: TeaDashboardBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.TEA_PRACTICE,
      page: () => const TeaPracticeView(),
      binding: TeaPracticeBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.TEA_VIDEO,
      page: () => const TeaVideoView(),
      binding: TeaVideoBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.TEA_USER,
      page: () => const TeaUserView(),
      binding: TeaUserBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.TEA_CHAT,
      page: () => const TeaChatView(),
      binding: TeaChatBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.TEA_CHAT_DETAILS,
      page: () => const ChatDetailPage(),
      binding: TeaChatBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
      // transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
    ),
    GetPage(
      name: _Paths.TEA_VIEW_CHAT,
      page: () => const TeaViewChatView(),
      binding: TeaViewChatBinding(),
      transition: Transition.cupertino,
      curve: Curves.linear,
    ),
  ];
}
