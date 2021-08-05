import 'package:get/get.dart';
import 'package:wallstreetbets/app/data/model/model.dart';
import 'package:wallstreetbets/app/data/repository/post_repository.dart';

class HomeController extends GetxController {
  final PostRepository repository;
  HomeController({required this.repository});

  final _postList = RxList<Post>().obs;
  get postList => this._postList.value;
  set postList(value) => this._postList.value = value;

  getAll() {
    repository.getAll().then((data) => {this.postList = data});
  }

  getBull() {
    this._postList().sort((a, b) => b.sentimentScore.compareTo(a.sentimentScore));
  }

  getBear() {
    this._postList().sort((a, b) => a.sentimentScore.compareTo(b.sentimentScore));
  }
}
