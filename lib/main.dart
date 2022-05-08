// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttersix/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final switchT = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          theme: switchT.switchToggle.isFalse
              ? ThemeData.dark()
              : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }
}