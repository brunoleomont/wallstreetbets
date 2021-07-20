import 'package:get/get.dart';
import 'package:wallstreetbets/app/controller/home_controller/home_controller.dart';
import 'package:wallstreetbets/app/data/provider/api.dart';
import 'package:wallstreetbets/app/data/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: PostRepository(
              apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
