import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Business Today'),
        centerTitle: true,
      ),
      body: Obx(()=>controller.items.value.articles?[0].urlToImage!=null?ListView.builder(
        itemCount: controller.items.value.articles?.length,
          itemBuilder:(BuildContext context,int index)

          {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            trailing: const SizedBox(),
            leading: Container(
              height: 260,
              width: 60,
              child: controller.items.value.articles?[index].urlToImage!=null?Image.network("${controller.items.value.articles?[index].urlToImage}"):Container(
                child: Text("No Image",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),),
              ),
            ),
              title: Text("${controller.items.value.articles?[index].title}",style: TextStyle(
                fontSize: 23,
              fontWeight: FontWeight.w700
          ),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Published Time: ${controller.items.value.articles?[index].publishedAt}",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(
                  height: 10,
                ),
                Text("Author: ${controller.items.value.articles?[index].author}",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("${controller.items.value.articles?[index].content}",style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w400
                ),),
              )
            ],

          ),
        );

      },

      ):Container())
    );
  }
}
