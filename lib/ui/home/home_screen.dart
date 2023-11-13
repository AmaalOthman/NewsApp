import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/categories_fragment.dart';
import 'package:news_app/ui/home/categories/category.dart';
import 'package:news_app/ui/home/categorydetails/category_details.dart';
import 'package:news_app/ui/home/homedrawer.dart';
import 'package:news_app/ui/home/settings/settings_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget =CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/img.png'),
          fit: BoxFit.cover
        )
      ),
        child: Scaffold(
          drawer: HomeDrawer(onMenueItemClick),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('News App',),
          ),
          body: selectedWidget,
        )
    );
  }

  late Widget selectedWidget ;

 void onMenueItemClick(MenueItem item){
   Navigator.pop(context);
   switch(item){
     case MenueItem.categories :{
       selectedWidget = CategoriesFragment(onCategoryItemClick);

     }
break;
     case MenueItem.settings :{
       selectedWidget= SettingsFragment();
     }
   }
   setState((){});

 }
 void onCategoryItemClick(Category category){
   selectedWidget = CategoryDetails(category);
   setState(() {

   });
 }
}
