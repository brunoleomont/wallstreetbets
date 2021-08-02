import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallstreetbets/app/controller/home_controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wall Street Bets'),
      ),
      body: Container(
        child: GetX<HomeController>(
          initState: (state) {Get.find<HomeController>().getAll();},
          builder: (_) {
          return _.postList.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                itemBuilder: (contex, index) {
                  return ListTile(
                    title: Text((index+1).toString() + '° - ' + _.postList[index].ticker),
                    subtitle: Text(_.postList[index].sentiment),
                  );
                },
                itemCount: _.postList.length,
              );
        }),
      ),
    );
  }
}
