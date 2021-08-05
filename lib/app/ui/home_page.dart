import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallstreetbets/app/controller/home_controller/home_controller.dart';
import 'package:wallstreetbets/app/ui/theme/app_theme.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wall Street Bets'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_sharp),
            onPressed: () => showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Filter'),
                      content: const Text('Filter by Bullish or Bearish'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: () => Navigator.pop(
                              context, Get.find<HomeController>().getBull()),
                          child: const Text('Bull First'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () => Navigator.pop(
                              context, Get.find<HomeController>().getBear()),
                          child: const Text('Bear First'),
                        ),
                      ],
                    )),
          ),
        ],
      ),
      body: Container(
        child: GetX<HomeController>(initState: (state) {
          Get.find<HomeController>().getAll();
        }, builder: (_) {
          return _.postList.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (contex, index) {
                    return Card(
                      elevation: 6,
                      margin: EdgeInsets.all(6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString() + '°',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: appThemeData.accentColor,
                        ),
                        title: Text(_.postList[index].ticker,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(_.postList[index].sentiment),
                        trailing: _.postList[index].sentimentScore > 0.0
                            ? Icon(Icons.trending_up, color: Colors.green)
                            : Icon(Icons.trending_down, color: Colors.red),
                      ),
                    );
                  },
                  itemCount: _.postList.length,
                );
        }),
      ),
    );
  }
}
