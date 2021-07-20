import 'package:get/get.dart';
import 'package:wallstreetbets/app/routes/app_routes.dart';
import 'package:wallstreetbets/app/ui/home_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.INITIAL, page: () => HomePage())
  ];
}
