import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:wallstreetbets/app/data/model/model.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

class MyApiClient {
    final http.Client httpClient;
    MyApiClient({required this.httpClient});

    getAll() async {
      try {
        var response = await httpClient.get(Uri.parse(baseUrl));
        if (response.statusCode == 200) {
          Iterable jsonResponse = json.decode(response.body);
          List<Post> listPosts = jsonResponse.map((post) => Post.fromJson(post)).toList();
          return RxList<Post>.of(listPosts);
        } else {
          print('erro');
        }
      } catch(_){}
    }
}
