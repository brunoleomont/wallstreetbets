import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallstreetbets/app/bindings/home_binding.dart';
import 'package:wallstreetbets/app/routes/app_pages.dart';
import 'package:wallstreetbets/app/routes/app_routes.dart';
import 'package:wallstreetbets/app/ui/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      home: HomePage(),
    ));
}
