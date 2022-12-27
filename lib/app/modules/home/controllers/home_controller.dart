import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../model/getNews.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  var itmeList = <Articles>[].obs;
  var items =GetNews().obs;

  Future<GetNews> getNewsDataCall() async{
    //print(id);

    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a303b001aa80461cb17b501c2e68c6bb"));
    if(response.statusCode!=200){
      return Future.error(response.body);
    }else{
      log(GetNews.fromJson(jsonDecode(response.body)).toString());
      items.value=GetNews.fromJson(jsonDecode(response.body));
      return GetNews.fromJson(jsonDecode(response.body));
    }
  }



}
