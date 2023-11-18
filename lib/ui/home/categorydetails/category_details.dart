import 'package:flutter/material.dart';
import 'package:news_app/api/Api_Manager.dart';
import 'package:news_app/ui/home/categories/category.dart';
import 'package:news_app/ui/home/categorydetails/CategoryDetailsViewModel.dart';
import 'package:news_app/ui/home/categorydetails/sources_tabs_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});


  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(onPressed: () {
                    viewModel.getSources(widget.category.id);
                  }, child: Text('TryAgain'))
                ],
              ),
            );
          }
          var sourcesList = viewModel.newSourcesList;
          return SourcesTabsWidget(sourcesList!);
        },
      ),
    );
  }
}

