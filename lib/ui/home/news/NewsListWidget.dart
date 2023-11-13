import 'package:flutter/material.dart';
import 'package:news_app/api/Api_Manager.dart';
import 'package:news_app/model/sourcesresponse/Source.dart';
import 'package:news_app/ui/home/news/news_widget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    //call api
    return FutureBuilder(
      future: ApiManager.getNews(source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsWidget(newsList![index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}
