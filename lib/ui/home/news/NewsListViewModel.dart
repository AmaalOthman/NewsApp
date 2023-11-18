import 'package:flutter/material.dart';
import 'package:news_app/api/Api_Manager.dart';
import 'package:news_app/model/newsResponse/News.dart';

class NewsListViewModel extends ChangeNotifier{
  bool? showLoading;
  List<News>? newsList;
  String? errorMessage;

  void getNews(String sourceId)async{
    showLoading = true;
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManager.getNews(sourceId);

      showLoading = false;
      if(response.status == 'error'){
        errorMessage = response. message;
      }else {
        newsList = response.articles;
      }
    }
    catch(e){
      showLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}