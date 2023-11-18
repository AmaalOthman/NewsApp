import 'package:flutter/material.dart';
import 'package:news_app/model/sourcesresponse/Source.dart';
import 'package:news_app/ui/home/news/NewsListViewModel.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:provider/provider.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(onPressed: () {
                    viewModel.getNews(widget.source.id??"");
                  }, child: Text('Try Again'))
                ],
              ),
            );
          }
          var newsList = viewModel.newsList;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );

    //call api
    //    return FutureBuilder(
    //       future: ApiManager.getNews(source.id),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Center(child: CircularProgressIndicator());
    //         }
    //         if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //           return Center(
    //             child: Column(
    //               children: [
    //                 Text(snapshot.data?.message ?? snapshot.error.toString()),
    //                 ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //               ],
    //             ),
    //           );
    //         }
    //         var newsList = snapshot.data?.articles;
    //         return ListView.builder(
    //           itemBuilder: (context, index) {
    //             return NewsWidget(newsList![index]);
    //           },
    //           itemCount: newsList?.length ?? 0,
    //         );
    //       },
    //     );
  }
}
