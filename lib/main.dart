import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/core/binding/initial_binding.dart';
import 'app/core/constants/app_constants.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "Zaag Task",
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          defaultTransition: transition,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            useMaterial3: false,

          ),
        );
      },
    ),
  );
}
