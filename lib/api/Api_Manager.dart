import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/newsResponse/NewsResponse.dart';
import 'package:news_app/model/sourcesresponse/SourcesResponse.dart';
class ApiManager{
  // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static const baseUrl ='newsapi.org';
  static const apiKey ='252f85b218ee442bb25bfabd6cf2dfdd';
  static Future<SourcesResponse> getSources(String categoryId) async {
    //apiKey =Api_key
    var uri = Uri.https(baseUrl,'v2/top-headlines/sources',
    {"apiKey":apiKey,
    "category": categoryId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse =SourcesResponse.fromJson(json);
    return sourcesResponse;
    //response.body -> json -> 0bjects
  }
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=252f85b218ee442bb25bfabd6cf2dfdd
  static Future<NewsResponse> getNews(String? sourceId)async{
    var url = Uri.https(baseUrl,"v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}