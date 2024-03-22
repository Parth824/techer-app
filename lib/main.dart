import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_lancer_teacher/app/core/theme/app_theme.dart';
import 'package:tech_lancer_teacher/app/utils/network_controlle_widget.dart';

import 'app/core/services/storage_service.dart';
import 'app/data/networks/api_controller.dart';
import 'app/data/networks/api_controller2.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.dark));
        return SafeArea(
          child: GetMaterialApp(
            builder: (context, child) {
              child = child;
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: StreamBuilder(
                    stream: Connectivity().onConnectivityChanged,
                    builder:
                        (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                      if (snapshot.hasData) {
                        ConnectivityResult? result = snapshot.data;
                        if (result == ConnectivityResult.mobile ||
                            result == ConnectivityResult.wifi) {
                          return child!;
                        } else {
                          return noInternet();
                        }
                      } else {
                        return noInternet();
                      }
                    },
                  ),
                ),
              );
            },
            onInit: () {
              Get.put(ApiController());
              Get.put(ApiController2());
            },
            debugShowCheckedModeBanner: false,
            title: "Teach-Lancer",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
          ),
        );
      },
    );
  }
}

var height = MediaQuery.sizeOf(Get.context!).height;
var width = MediaQuery.sizeOf(Get.context!).width;