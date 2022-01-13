//import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_demo/constants/strings.dart';
import 'package:news_demo/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    //var client = http.Client();
    var newsModel = null;

try{
    var response = await http.get(Uri.parse(Strings.news_url));
    if (response.statusCode == 200) {
      print(response.body);

      var jsonMap = json.decode(jsonString);
       newsModel = NewsModel.fromJson(jsonMap);
    }
    }
    catch(Exception)
      
    {
    return newsModel;
    }
  }
}
