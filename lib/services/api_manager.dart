//import 'dart:convert';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_demo/constants/strings.dart';
import 'package:news_demo/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    //var client = http.Client();
    var newsModel;

    try {
      var response = await http.get(Uri.parse(Strings.news_url));
      print('response.statusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        //print(response.body);
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap); //errorr
        // debugPrint(jsonMap);
        // print('sscs');
      }
    } catch (Exception) {
      // return newsModel;
      print('API not found');
    }
    return newsModel;
  }
}
